//
//  ViewController.swift
//  appnews
//
//  Created by leopardx on 10/3/16.
//  Copyright © 2016 Taller de Código. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Alamofire.request(.GET, "https://televisa.news/wp-json/wp/v2/breaking/").responseJSON{ (responseData) -> Void in
            
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


}

