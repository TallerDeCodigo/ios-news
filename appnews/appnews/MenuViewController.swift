//
//  MenuViewController.swift
//  appnews
//
//  Created by programacion 1 on 11/29/16.
//  Copyright © 2016 Taller de Código. All rights reserved.
//

import UIKit
import SwiftyJSON

class MenuViewController: UIViewController {
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollView)
        
        let bounds = self.view.bounds
        
        let ancho = bounds.size.width
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: Int(ancho), height: 68))
        navBar.tintColor = UIColor.cyan
        self.view.addSubview(navBar)
        let navItem = UINavigationItem(title: "Menú")
        let menuItem = UIBarButtonItem(title: "Cerrar", style: .plain, target: self, action: Selector(("Action1:")))
        navItem.leftBarButtonItem = menuItem
        navBar.setItems([navItem], animated: false)
        
        let tabla: UITableView = UITableView()
        
        let menuItem1: UITableViewCell = UITableViewCell()
        
        tabla.addSubview(menuItem1)
        
        let menuItem2: UITableViewCell = UITableViewCell()
        
        tabla.addSubview(menuItem2)
        
        self.scrollView.addSubview(tabla)
        
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
