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
        setUpTabBar(img: "tabbar_1", selImg: "tabbar_1_sle", title: "首页", viewController: HomeViewController())
        setUpTabBar(img: "tabbar_3", selImg: "tabbar_3_sle", title: "商城", viewController: StoreViewController())
        setUpTabBar(img: "tabbar_2", selImg: "tabbar_2_sle", title: "门店", viewController: ShopViewController())
        setUpTabBar(img: "tabbar_4", selImg: "tabbar_4_sle", title: "我的", viewController: MineViewController())
        
    }
    
    func setUpTabBar(img: String, selImg: String, title:String, viewController: BaseViewController) -> Void {
        
        viewController.tabBarItem.image = kGetImage(name: img)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = kGetImage(name: selImg)?.withRenderingMode(.alwaysOriginal)
        viewController.title = title
        viewController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0, alpha: 1)], for: .normal)
        viewController.tabBarItem.setTitleTextAttributes([.foregroundColor: MainColor, .font: UIFont.systemFont(ofSize: 12)], for: .selected)
        self.addChild(viewController)
        
    }
    
}
