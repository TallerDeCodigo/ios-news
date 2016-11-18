//
//  FeedTableViewController.swift
//  appnews
//
//  Created by leopardx on 10/3/16.
//  Copyright © 2016 Taller de Código. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension Data {
    var attributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options:[NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
extension String {
    var utf8Data: Data? {
        return data(using: .utf8)
    }
}

class FeedTableViewController: UITableViewController {
    
//    var feedNews = [News]()
    
    var feedNews:NSMutableArray = []
    var json : JSON = JSON.null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
    
        Alamofire.request("https://televisa.news/wp-json/news/v1/region/cdmx").responseJSON{ (response) -> Void in
            
            if((response.result.value) != nil) {
            
                guard let data = response.result.value else{
                    print("Request failed with error")
                    return
                }
                
                self.json = JSON(data)
                self.tableView.reloadData()
            
            }
            
        }
        
        self.tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "news")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch self.json.type
        {
        case Type.array:
            return self.json.count
        default:
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! FeedTableViewCell

        // Configure the cell...
        
        // Get row index
        let row = indexPath.row
        
        
        print(self.json[row]["title"])
        
        //Make sure post title is a string
        if let title = self.json[row]["post_title"].string{
            print("Titulo: " + title)
            
            cell.titleLabel!.text = title
        }else{
            cell.titleLabel!.text = "Sin title"
        }
        
        
        //Make sure post title is a string
        if let content = self.json[row]["post_excerpt"].string{
            print("Content: " + content)
            let content_parse = content.utf8Data?.attributedString
            cell.txtContent!.text = content
        }else{
            cell.txtContent!.text = ""
        }
        
    
        
        //Make sure post date is a string
//        if let date = self.json[row]["date"].string{
//            cell.postDate!.text = date
//        }
//        
//        if let image = self.json[row]["featured_image"]["attachment_meta"]["sizes"]["medium"]["url"].string{
//            
//            if image != "null"{
//                
//                ImageLoader.sharedLoader.imageForUrl(image, completionHandler:{(image: UIImage?, url: String) in
//                    cell.postImage.image = image!
//                })
//            }
//        }
       
        
        return cell
    }
    
    func populateFields(_ cell: FeedTableViewCell, index: Int){
        
        print("populateFields")
        
        //Make sure post title is a string
        guard let title = self.json[index]["post_title"].string else{
            cell.titleLabel!.text = "Loading..."
            return
        }
        
        // An action must always proceed the guard conditional
        cell.titleLabel!.text = title
        
        //Make sure post date is a string
//        guard let date = self.json[index]["date"].string else{
//            cell.postDate!.text = "--"
//            return
//        }
//        
//        cell.postDate!.text = date
        
        /*
         * Set up Featured Image
         * Using guard, there's no need for nested if statements
         * to unwrap and check optionals
         */
        
//        guard let image = self.json[index]["featured_image_thumbnail_url"].string where
//            image != "null"
//            else{
//                
//                print("Image didn't load")
//                return
//        }
//        
//        ImageLoader.sharedLoader.imageForUrl(image, completionHandler:{(image: UIImage?, url: String) in
//            cell.postImage.image = image!
//        })
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //Which view controller are we sending this to?
        let postScene = segue.destination as! BreakingViewController;
        
        //pass the selected JSON to the "viewPost variable of the BreakingViewController Class
        if let indexPath = self.tableView.indexPathForSelectedRow?.row{
            
            let selected = self.json[indexPath]
            postScene.viewPost = selected
            
            
        }
        
        
    }
    

}
