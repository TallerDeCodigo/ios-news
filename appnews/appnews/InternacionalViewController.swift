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
    
    func adjustConstFullSize(adjustedView: UIView!, parentView: UIView!) {
        
        let topConstraint = NSLayoutConstraint(item: adjustedView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: parentView,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 0.0)
        
        let leftConstraint = NSLayoutConstraint(item: adjustedView,
                                                attribute: .leading,
                                                relatedBy: .equal,
                                                toItem: parentView,
                                                attribute: .leading,
                                                multiplier: 1.0,
                                                constant: 0.0)
        
        let rightConstraint = NSLayoutConstraint(item: adjustedView,
                                                 attribute: .trailing,
                                                 relatedBy: .equal,
                                                 toItem: parentView,
                                                 attribute: .trailing,
                                                 multiplier: 1.0,
                                                 constant: 0.0)
        
        
        let bottomConstraint = NSLayoutConstraint(item: adjustedView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: parentView,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: 0.0)
        
        parentView.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
        
    }
    
    
    
    func getInternacionalNews() -> Void {
        
        var y_t = 0
        
        Alamofire.request("https://televisa.news/wp-json/news/v1/region/internacional").responseJSON{ (responseData) -> Void in
            
            if((responseData.result.value) != nil) {
                
                let swiftyJsonVar = JSON(responseData.result.value!)
                
               // print(swiftyJsonVar)
                
                if let resData = swiftyJsonVar.arrayObject {
                    
                    var y = 30
                    
                    let bounds = self.view.bounds
                    
                    let ancho = bounds.size.width
                    
                    //If json is .Dictionary
                    
                    for key in resData {
                        
                        let v = CardsView(frame: CGRect(x: 0, y: y, width: Int(ancho), height: 300))
                        
                        
                        //Images
                        
                        let containerView: UIView = UIView(frame:CGRect(x: 0, y: 0, width: Int(ancho), height: 180))
                        
                        containerView.clipsToBounds = true

                        v.addSubview(containerView)
                        
                        let imageViewObject : UIImageView = UIImageView();
                        
                        imageViewObject.image = UIImage(named:"bkg_thumb")
                        
                        imageViewObject.contentMode = UIViewContentMode.scaleAspectFill
                        
                        imageViewObject.translatesAutoresizingMaskIntoConstraints = false
                        
                        imageViewObject.clipsToBounds = true

                        containerView.addSubview(imageViewObject)
                        
                        self.adjustConstFullSize(adjustedView: imageViewObject, parentView: containerView)
                        
                        
                        //Title
                        let txtTitle = UILabel(frame: CGRect(x:0, y: 180, width: Int(ancho), height: 30));
                        
                        txtTitle.text = String(y_t)
                    
                        v.addSubview(txtTitle)
                        
                        let txtExcerpt = UITextView(frame: CGRect(x:0, y: 210, width: Int(ancho), height: 70));
                        
                        txtExcerpt.isUserInteractionEnabled = false
                        
                        txtExcerpt.backgroundColor = UIColor.clear
                        
                        txtExcerpt.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis"
                        
                        v.addSubview(txtExcerpt)
                        
                        v.backgroundColor = UIColor.white
                        
                        self.scrollView.addSubview(v);

                        y = y + 330
                        
                        y_t = y + 330
                    }
                    
                }
                
            }
            
        }
        
        self.scrollView.contentSize = CGSize(width: 360, height: y_t)
    }
    
    //func ratingButtonTapped(button: UIButton) {
    //    print("Button pressed 👍")
    //}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
