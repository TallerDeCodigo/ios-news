//
//  ViewController.swift
//  appnews
//
//  Created by leopardx on 10/3/16.
//  Copyright © 2016 Bild Media. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Firebase
import FirebaseInstanceID
import FirebaseMessaging

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Alamofire.request("http://noticieros.televisa.com/wp-json/news/v1/region/cdmx").responseJSON{ (responseData) -> Void in
            
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                print(swiftyJsonVar)
                
                if let resData = swiftyJsonVar.arrayObject {
                    
                    print(resData)

                }
              
            }
        
        }
        
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleLogTokenTouch(_ sender: UIButton) {
        // [START get_iid_token]
        let token = FIRInstanceID.instanceID().token()
        print("InstanceID token: \(token!)")
        // [END get_iid_token]
    }
    
    @IBAction func handleSubscribeTouch(_ sender: UIButton) {
        // [START subscribe_topic]
        FIRMessaging.messaging().subscribe(toTopic: "/topics/news")
        print("Subscribed to news topic")
        // [END subscribe_topic]
    }


}

