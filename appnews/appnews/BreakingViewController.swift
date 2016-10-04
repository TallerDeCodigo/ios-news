//
//  BreakingViewController.swift
//  appnews
//
//  Created by leopardx on 10/4/16.
//  Copyright © 2016 Taller de Código. All rights reserved.
//

import UIKit
import SwiftyJSON

class BreakingViewController: UIViewController {
    
    var viewPost : JSON = JSON.null

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let postTitle = self.viewPost["title"].string{
            print(postTitle)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
