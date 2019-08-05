//
//  HxsModels.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/5.
//  Copyright © 2019 工博科技. All rights reserved.
//

import Foundation
import ObjectMapper
class CyclePicModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        AD_Location <- map["AD_Location"]
        AD_Name <- map["AD_Name"]
        AD_No <- map["AD_No"]
        PicAddress1 <- map["PicAddress1"]
        PicAddress2 <- map["PicAddress2"]
        url <- map["url"]
    }
    
    var AD_Location: String?
    var AD_Name: String?
    var AD_No: String?
    var PicAddress1: String?
    var PicAddress2: String?
    var url: String?
    
}

class ClassifyModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        ClassifyName <- map["ClassifyName"]
        ClassifyNo <- map["ClassifyNo"]
        ParentNo <- map["ParentNo"]
        pictureurl <- map["pictureurl"]
     
    }
    
    var ClassifyName: String?
    var ClassifyNo: String?
    var ParentNo: String?
    var pictureurl: String?
    
}
