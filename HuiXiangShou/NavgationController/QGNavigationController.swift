//
//  QGNavigationController.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/27.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

class QGNavigationController: UINavigationController {
    override func viewDidLoad() {
        self.navigationBar.barTintColor =  MainColor
        self.navigationBar.isTranslucent = false
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //如果不是栈底的控制器才需要隐藏，跟控制器不需要处理
        if self.viewControllers.count > 0{
            //隐藏tabBar
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }

}
