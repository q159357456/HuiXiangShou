//
//  CommonUseDefine.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/24.
//  Copyright © 2019 工博科技. All rights reserved.
//
import UIKit
import Foundation
//版本

let SYSTEM_VERSION : String = UIDevice.current.systemVersion

let SYSTEM_VERSION_FLOAT : Float = Float(SYSTEM_VERSION)!

//判断版本

func IS_EQUAL_IOS (version: Float) -> Bool {
    
    return (SYSTEM_VERSION_FLOAT == version)
    
}

func IS_GREATER_IOS (version: Float) -> Bool{
    
    return (SYSTEM_VERSION_FLOAT > version)
    
}

func IS_LESS_IOS (version: Float) -> Bool{
    
    return (SYSTEM_VERSION_FLOAT < version)
    
}
func IS_GREATER_EQUAL_IOS (version: Float) -> Bool{
    
    return (SYSTEM_VERSION_FLOAT >= version)
    
}
func IS_LESS_EQUAL_IOS (version: Float) -> Bool{
    
    return (SYSTEM_VERSION_FLOAT <= version)
    
}

// 屏幕宽高

let SCREEN_WIDTH : CGFloat = min(UIScreen.main.bounds.width,UIScreen.main.bounds.height)
let SCREEN_HEIGHT : CGFloat = max(UIScreen.main.bounds.width,UIScreen.main.bounds.height)




/// 相对于 750 宽的屏幕比例

let SCREEN_WIDTH_SCALE_47: CGFloat = SCREEN_WIDTH/375.0

let SCREEN_HEIGHT_SCALE_47: CGFloat = SCREEN_HEIGHT/667.0


func kBoldSystemFont(font: CGFloat) -> (UIFont) {
    
    return UIFont.boldSystemFont(ofSize: font)
    
}

func kSystemFont(font: CGFloat) -> (UIFont) {
    
    return UIFont.systemFont(ofSize: font)
    
}
func kGetImage(name: String) -> (UIImage)? {
    
    return UIImage.init(named: name)
    
}
let kUserDefaults: UserDefaults = UserDefaults.standard
let kNotification: NotificationCenter = NotificationCenter.default

func kNotificationPost (name: String){
    
    kNotification.post(name: NSNotification.Name(rawValue: name), object: nil)
    
}

let kAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

func RGB(_ r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
    
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    
}

func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)}

func HEXA(hexValue: Int, a: CGFloat) -> (UIColor) {
    return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0,green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hexValue & 0xFF)) / 255.0,alpha: a)
}

func HEX(hexValue: Int) -> (UIColor) {
    
    return HEXA(hexValue: hexValue, a: 1.0)
    
}

let iPhone4 = SCREEN_HEIGHT  < 568 ? true : false

// iPhone 5
let iPhone5 = SCREEN_HEIGHT  == 568 ? true : false

// iPhone 6
let iPhone6 = SCREEN_HEIGHT  == 667 ? true : false

let iPhone6P = SCREEN_HEIGHT == 736 ? true : false

// iphone X
let iPhoneX = SCREEN_HEIGHT == 812 ? true : false

// navigationBarHeight
let kNavigationBarHeight : CGFloat = iPhoneX ? 88 : 64
let kTabBarHeight : CGFloat = iPhoneX ? 49 + 34 : 49


/** 如果是iPhoneX按照Plus 尺寸计算比例 */
let Scale_Height = iPhoneX ? 736.0/667.0 : SCREEN_HEIGHT / 667

let Scale_Width = SCREEN_WIDTH / 375


func W_Scale(x:CGFloat) -> CGFloat {
    
    return Scale_Width * x
    
}



func H_Scale(y:CGFloat) -> CGFloat {
    
    return Scale_Height * y
    
}
