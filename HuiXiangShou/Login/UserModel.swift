//
//  UserModel.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/31.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import ObjectMapper
class UserModel: Mappable {
    var id: Int?
    var title: String?
    var body: String?
    var userId: Int?
    var subC: SubModel?
    
    
    init() {
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
    }
    
    
}
class SubModel: Mappable {
    var name: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
    
    
}


