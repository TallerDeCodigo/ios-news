//
//  ImageLoader.swift
//  appnews
//
//  Created by leopardx on 10/4/16.
//  Copyright © 2016 Taller de Código. All rights reserved.
//

import UIKit

class ImageLoader {
    
    var cache = NSCache<AnyObject, AnyObject>()
    
    class var sharedLoader : ImageLoader {
        struct Static {
            static let instance : ImageLoader = ImageLoader()
        }
        return Static.instance
    }
    
    func imageForUrl(_ urlString: String, completionHandler:@escaping (_ image: UIImage?, _ url: String) -> ()) {
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.background).async(execute: {()in
            let data: Data? = self.cache.object(forKey: urlString as AnyObject) as? Data
            
            if let goodData = data {
                let image = UIImage(data: goodData)
                DispatchQueue.main.async(execute: {() in
                    completionHandler(image, urlString)
                })
                return
            }
            
//            var downloadTask: NSURLSessionDataTask = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: urlString)!, completionHandler: {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
//                if (error != nil) {
//                    completionHandler(image: nil, url: urlString)
//                    return
//                }
//                
//                if data != nil {
//                    let image = UIImage(data: data)
//                    self.cache.setObject(data, forKey: urlString)
//                    dispatch_async(dispatch_get_main_queue(), {() in
//                        completionHandler(image: image, url: urlString)
//                    })
//                    return
//                }
//                
//            })
//            downloadTask.resume()
        })
        
    }
}
