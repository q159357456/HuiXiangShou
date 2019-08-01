//
//  StringExtention.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/8/1.
//  Copyright © 2019 工博科技. All rights reserved.
//

import Foundation
extension String{
    func toData() -> Data {
        return self.data(using: String.Encoding.utf8)!
    }
    
}
