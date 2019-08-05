//
//  DictionnaryExtention.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/5.
//  Copyright © 2019 工博科技. All rights reserved.
//

import Foundation
extension Dictionary{
    
    func toData() -> Data?{
        if (!JSONSerialization.isValidJSONObject(self)) {
            print("is not a valid json object")
            return nil
        }
        //利用自带的json库转换成Data
        //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
        let data = try? JSONSerialization.data(withJSONObject: self, options: [])
        //Data转换成String打印输出
//        let str = String(data:data!, encoding: String.Encoding.utf8)
//       // 输出json字符串
//         print("Json Str:\(str!)")
        
        return data
        

    }
    
    func toString() -> String? {
        if (!JSONSerialization.isValidJSONObject(self)) {
            print("is not a valid json object")
            return nil
        }
        //利用自带的json库转换成Data
        //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
        let data = try? JSONSerialization.data(withJSONObject: self, options: [])
        //Data转换成String打印输出
        let str = String(data:data!, encoding: String.Encoding.utf8)
        
        return str
      
    }
}
