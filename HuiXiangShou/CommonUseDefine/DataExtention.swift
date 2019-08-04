//
//  DataExtention.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/8/2.
//  Copyright © 2019 工博科技. All rights reserved.
//

import Foundation
extension Data{
    
    func toDic() -> Dictionary<String, Any>? {
        
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: .mutableContainers)
            let dic = json as! Dictionary<String, Any>
            return dic
            
        } catch _ {
            return nil
        }
    }
    
    
    func toArray() -> [Any]? {
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: .mutableContainers)
            let array = json as! [Any]
            return array
            
        } catch _ {
            return nil
        }
    }
}
