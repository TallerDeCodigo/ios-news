//
//  InternacionalViewController.swift
//  appnews
//
//  Created by hever on 11/17/16.
//  Copyright © 2016 Taller de Código. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class InternacionalViewController: UIViewController {
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView = UIScrollView(frame: view.bounds)
        
        self.view.addSubview(scrollView)
        
        getInternacionalNews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getInternacionalNews() -> Void {
        
        Alamofire.request("https://televisa.news/wp-json/news/v1/region/internacional").responseJSON{ (responseData) -> Void in
            
            if((responseData.result.value) != nil) {
                
                let swiftyJsonVar = JSON(responseData.result.value!)
                
               // print(swiftyJsonVar)
                
                if let resData = swiftyJsonVar.arrayObject {
                    
                    var y = 30
                    
                    //If json is .Dictionary
                    
                    for key in resData {
                        
                        let v = CardsView(frame: CGRect(x: 7, y: y, width: 360, height: 300))
                        
                        //Images
                        
                        var imageViewObject : UIImageView
                        imageViewObject = UIImageView(frame:CGRect(x: 0, y: 0, width: 360, height: 180));
                        imageViewObject.image = UIImage(named:"bkg_thumb")
                        
                        v.addSubview(imageViewObject)
                        
                        //Title
                        let txtTitle = UILabel(frame: CGRect(x:10, y: 180, width: 300, height: 30));
                        
                        txtTitle.text = "Hola mundo"
                    
                        v.addSubview(txtTitle)
                        
                        let txtExcerpt = UITextView(frame: CGRect(x:10, y: 210, width: 300, height: 70));
                        
                        txtExcerpt.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis"
                        
                        
                        v.addSubview(txtExcerpt)
                        
                        v.backgroundColor = UIColor.lightGray
                        
                        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
                        button.backgroundColor = UIColor.red
                        
                        
                        v.addSubview(button)
                        
                        self.scrollView.addSubview(v);

                        y = y + 310
                    }
                    
                }
                
            }
            
        }
        
        self.scrollView.contentSize = CGSize(width: 360, height: 3150)
    }
    
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
