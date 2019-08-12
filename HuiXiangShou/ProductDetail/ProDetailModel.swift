//
//  ProDetailModel.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/12.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import ObjectMapper
class ProDetailModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        Address <- map["Address"]
        Bonus <- map["Bonus"]
        Brand <- map["Brand"]
        Classify_2 <- map["Classify_2"]
        GoodsDetail <- map["GoodsDetail"]
        InventoryQty <- map["InventoryQty"]
        InventoryQty1 <- map["InventoryQty1"]
        PicAddress1 <- map["PicAddress1"]
        PicAddress2 <- map["PicAddress2"]
        PicAddress3 <- map["PicAddress3"]
        PicAddress4 <- map["PicAddress4"]
        PicAddress5 <- map["PicAddress5"]
        PicAddress6 <- map["PicAddress6"]
        ProductDesc <- map["ProductDesc"]
        ProductName <- map["ProductName"]
        ProductNo <- map["ProductNo"]
        ProductSpec <- map["ProductSpec"]
        Property <- map["Property"]
        RetailPrice <- map["RetailPrice"]
        SellQty <- map["SellQty"]
        StanPrice <- map["StanPrice"]
        StanPurPrice <- map["StanPurPrice"]
        SupplierName <- map["SupplierName"]
        SupplierNo <- map["SupplierNo"]
        Unit <- map["Unit"]
        VBonus <- map["VBonus"]
        listPic <- map["listPic"]
        listSpec <- map["listSpec"]
        packagespec <- map["packagespec"]
        shopid <- map["shopid"]
    }
    var Address: String?
    var Bonus: Int?
    var Brand: String?
    var Classify_2: Int?
    var GoodsDetail: String?
    var InventoryQty: Int?
    var InventoryQty1: Int?
    var PicAddress1: String?
    var PicAddress2: String?
    var PicAddress3: String?
    var PicAddress4: String?
    var PicAddress5: String?
    var PicAddress6: String?
    var ProductDesc: String?
    var ProductName: String?
    var ProductNo: String?
    var ProductSpec: String?
    var Property: String?
    var RetailPrice: String?
    var SellQty: Int?
    var StanPrice: String?
    var StanPurPrice: String?
    var SupplierName: String?
    var SupplierNo: String?
    var Unit: String?
    var VBonus: Int?
    var listPic: [ListPicModel]?
    var listSpec: [ListSpecModel]?
    var packagespec: Int?
    var shopid: String?
    

}

class ListPicModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        fieldname <- map["fieldname"]
        path <- map["path"]
    }
    
    var fieldname: String?
    var path: String?
}

class ListSpecModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        DC001 <- map["DC001"]
        DC002 <- map["DC002"]
        DC003 <- map["DC003"]
        DC004 <- map["DC004"]
        DC005 <- map["DC005"]
        DC006 <- map["DC006"]
    }
    
    var DC001: String?
    var DC002: String?
    var DC003: String?
    var DC004: String?
    var DC005: String?
    var DC006: String?
    
    
    
}
