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

class FeedTableViewController: UITableViewController {
    
//    var feedNews = [News]()
    var feedNews:NSMutableArray = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
    
        Alamofire.request(.GET, "https://televisa.news/wp-json/wp/v2/breaking/").responseJSON{ (response) -> Void in
            
            if((response.result.value) != nil) {
                
                if let value = response.result.value as? NSMutableArray {
                    // handle the results as JSON, without a bunch of nested if loops
                    let todo = JSON(value)
                    
                    print(todo[0]["title"]["rendered"])
                    
                    if let title = todo[0]["title"]["rendered"].string {
                        // to access a field:
                        print("The title is: " + title)
                    } else {
                        print("error parsing")
                    }
                    
                    for post in value {
                        
                        print(post)
                        self.feedNews.addObject("Hola")
                    }
                    
                    
                    
                    self.tableView.reloadData()
                }
            }
            
        }
        
        self.tableView.registerClass(FeedTableViewCell.self, forCellReuseIdentifier: "news")

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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return feedNews.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as! FeedTableViewCell

        // Configure the cell...
        let dict = feedNews[indexPath.row]
        
        print(dict)
        
//        cell.titleLabel?.text = dict["id"] as? String;
        
        cell.titleLabel?.text = feedNews[indexPath.row] as? String
        
        
        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
