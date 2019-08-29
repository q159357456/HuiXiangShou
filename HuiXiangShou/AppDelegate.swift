//
//  AppDelegate.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/7/23.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    var userModel: UserModel?
    var window: UIWindow?
    var navigationController: QGNavigationController? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        listenLoginStatus()
        //定位
        LocationManager.singleton.creatLocationManager().startLocation { (cllocation, adress, erro) in
            if erro == nil{
                print(cllocation!.coordinate.latitude)
                print(cllocation!.coordinate.longitude)
                print(adress ?? "")
                CurenntCoordinate = Hxs_Coordinate(latitude:  String(cllocation!.coordinate.latitude), longitude: String(cllocation!.coordinate.longitude))
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

extension AppDelegate{
    
    func listenLoginStatus()  {
         kNotification.addObserver(self, selector: #selector(loginChangeEvent), name: NSNotification.Name(rawValue: LoginChanel), object: nil)
         kNotificationPost(name: LoginChanel)
    }
    
    @objc func loginChangeEvent() {
        
        var viewController = self.window?.rootViewController
        
        if kUserDefaults.value(forKey: TokenKey) != nil {
            let tabbar = QGTabbarController()
            self.navigationController = QGNavigationController(rootViewController: tabbar)
            self.window?.rootViewController = self.navigationController
        }else
        {
             self.window?.rootViewController = LoginViewController()
        }
        
        if (viewController != nil) {
            viewController = nil
        }
        
        
        
    }
    

}
