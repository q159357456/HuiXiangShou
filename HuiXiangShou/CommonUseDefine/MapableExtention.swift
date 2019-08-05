//
//  MapableExtention.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/5.
//  Copyright © 2019 工博科技. All rights reserved.
//

import Foundation
import ObjectMapper
extension Mappable{
    func toOrderJson() -> String? {
        let dic: [String: Any] = self.toJSON()
        let keyValues = dic.sorted{$0.0 < $1.0}
        var temp = [String]()
        
        for (key, value) in keyValues{
            if value.self is Int {
                 temp.append("\"\(key)\":\(value)")
            }else
            {
                 temp.append("\"\(key)\":\"\(value)\"")
            }
            
        }
        let result = "{\(temp.joined(separator: ","))}"
        return result
        
      
    }
}
