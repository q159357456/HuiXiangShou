//
//  QGTabbarController.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/27.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

class QGTabbarController: UITabBarController {
   
    override func viewDidLoad() {
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.isOpaque = false
        setUpTabBar(img: "", selImg: "", title: "首页", viewController: HomeViewController())
        setUpTabBar(img: "", selImg: "", title: "商城", viewController: StoreViewController())
        setUpTabBar(img: "", selImg: "", title: "门店", viewController: ShopViewController())
        setUpTabBar(img: "", selImg: "", title: "我的", viewController: MineViewController())
        
    }
    
    func setUpTabBar(img: String, selImg: String, title:String, viewController: BaseViewController) -> Void {
        
        viewController.tabBarItem.image = kGetImage(name: img)
        viewController.tabBarItem.selectedImage = kGetImage(name: selImg)
        viewController.title = title
        viewController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0, alpha: 1)], for: .normal)
        viewController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.red, .font: UIFont.systemFont(ofSize: 12)], for: .selected)
        self.addChild(viewController)
        
    }
    
}
