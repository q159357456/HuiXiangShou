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
        let keylist = dic.keys.sorted(by: {$0 < $1})
        var result: String?
        for ob in keylist{
            if result == nil{
                result =  "\"\(ob)\":\"\(dic[ob]!)\""
            }else
            {
                result =  "\(result ?? ""),\"\(ob)\":\"\(dic[ob]!)\""
            }
            
        }
        result = "{\(result!)}"

        return result
        
      
    }
}
