//
//  RequestBaseModel.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/1.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import ObjectMapper
class RequestBaseModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        appid <- map["appid"]
        timestamp <- map["timestamp"]
        sign <- map["sign"]
        dataList <- map["dataList"]
        basedata <- map["basedata"]
    }
    
    init() {
        
    }
    var appid: String = Hxs_Appid
    var timestamp: String = StringTimeStamp
    var sign: String?
    var dataList: DataList = DataList()
    var basedata: Basedata = Basedata()

}
class DataList: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        mobile <- map["mobile"]
        password <- map["password"]
        classifyno <- map["classifyno"]
        cityno <- map["cityno"]
        townno <- map["townno"]
        circleno <- map["circleno"]
        circlename <- map["circlename"]
        orderby <- map["orderby"]
        shopname <- map["shopname"]
        lat <- map["lat"]
        lng <- map["lng"]
        distance <- map["classifyno"]
    }
    init() {
        
    }
    var mobile: String?
    var password: String?
    var classifyno: String?
    var cityno: String?
    var townno: String?
    var circleno: String?
    var circlename: String?
    var orderby: String?
    var shopname: String?
    var lat: String?
    var lng: String?
    var distance: Float?
    
}

class Basedata: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        pageindex <- map["pageindex"]
        pagesize <- map["pagesize"]
        para1 <- map["para1"]
        para2 <- map["para2"]
        para3 <- map["para3"]
        para4 <- map["para4"]
        para5 <- map["para5"]
        para6 <- map["para6"]
        para7 <- map["para7"]
        para8 <- map["para8"]
        para9 <- map["para9"]
 
    }
    init() {
        
    }
    var pageindex: Int?
    var pagesize: Int?
    var para1: String?
    var para2: String?
    var para3: String?
    var para4: String?
    var para5: String?
    var para6: String?
    var para7: String?
    var para8: String?
    var para9: String?
    
}

