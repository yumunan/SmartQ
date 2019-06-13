//
//  TabbarController.swift
//  SmartQ
//
//  Created by 何大海 on 2019/5/6.
//  Copyright © 2019 tiny. All rights reserved.
//

import Foundation
import UIKit

class TabbarController: UITabBarController, UITabBarControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChildController(ChildController: HomeController(), Title: "首页", DefaultImage: UIImage(named:"home")!, SelectedImage: UIImage(named:"home")!)
//        self.addChildController(ChildController: LoginController(), Title: "首页", DefaultImage: UIImage(named:"home")!, SelectedImage: UIImage(named:"home")!)
        self.addChildController(ChildController: HistoryController(), Title: "历史", DefaultImage: UIImage(named:"history")!, SelectedImage: UIImage(named:"history")!)
        self.addChildController(ChildController: ProfileController(), Title: "账户", DefaultImage: UIImage(named:"profile")!, SelectedImage: UIImage(named:"profile")!)
        
        self.delegate = self
        self.tabBar.backgroundImage = CommonUtil.createImageFrom(Color: UIColor.white)
    }
    
    func addChildController(ChildController child:UIViewController, Title title:String, DefaultImage defaultImage:UIImage, SelectedImage selectedImage:UIImage){
        child.tabBarItem = UITabBarItem(title: title, image: defaultImage.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage.withRenderingMode(.alwaysOriginal))
        child.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:TABBAR_TINT_COLOR], for: .selected)
        
        let nav = BaseNavigationController(rootViewController: child)
        self.addChildViewController(nav)
        
    }
    
    
    
}
