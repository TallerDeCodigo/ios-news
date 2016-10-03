//
//  News.swift
//  appnews
//
//  Created by leopardx on 10/3/16.
//  Copyright © 2016 Taller de Código. All rights reserved.
//

import UIKit

class News:NSObject {
    
    var id: Int
    var title:String
    var excerpt: String
    
    init?(id:Int, title:String, excerpt:String){
        
        self.id         = id
        self.title      = title
        self.excerpt    = excerpt
        
        if title.isEmpty {
            return nil
        }
    }

}
