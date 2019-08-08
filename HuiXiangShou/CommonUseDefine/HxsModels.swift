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
    
    init() {
     
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
    init() {
        
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

class NoticeModel: Mappable {
    required init?(map: Map) {
        
    }
    init() {
        
    }
    func mapping(map: Map) {
        
        SHOPID <- map["SHOPID"]
        ID <- map["ID"]
        Msg <- map["Msg"]
        
    }
    
    var SHOPID: String?
    var ID: String?
    var Msg: String?
}

class GoodsListModel: Mappable {
    required init?(map: Map) {
        
    }
    init() {
        
    }
    func mapping(map: Map) {
        
        SHOPID <- map["SHOPID"]
        PicAddress1 <- map["PicAddress1"]
        ProductName <- map["ProductName"]
        ProductNo <- map["ProductNo"]
        ProductSpec <- map["ProductSpec"]
        RetailPrice <- map["RetailPrice"]
        SellPrice1 <- map["SellPrice1"]
        SellPrice2 <- map["SellPrice2"]
        StanPurPric <- map["StanPurPric"]
        SellQty <- map["SellQty"]
        SupplierNo <- map["SupplierNo"]
        Unit <- map["Unit"]
        classifyno <- map["classifyno"]
        
    }
    
    var SHOPID: String?
    var PicAddress1: String?
    var ProductName: String?
    var ProductNo: String?
    var ProductSpec: String?
    var RetailPrice: String?
    var SellPrice1: String?
    var SellPrice2: String?
    var StanPurPric: String?
    var SellQty: String?
    var SupplierNo: String?
    var Unit: String?
    var classifyno: String?
    
}

class ClassfyWithProModel: Mappable {
    required init?(map: Map) {
        
    }
    init() {
        
    }
    func mapping(map: Map) {
        ClassifyName <- map["ClassifyName"]
        ClassifyNo <- map["ClassifyNo"]
        ParentNo <- map["ParentNo"]
        pictureurl <- map["pictureurl"]
        goodslist <- map["goodslist"]
    }
    
    var ClassifyName: String?
    var ClassifyNo: String?
    var ParentNo: String?
    var pictureurl: String?
    var goodslist: [ProductModel]?
}


class ProductModel: Mappable {
    required init?(map: Map) {
        
    }
    init() {
        
    }
    func mapping(map: Map) {
        PicAddress1 <- map["PicAddress1"]
        ProductName <- map["ProductName"]
        ProductNo <- map["ProductNo"]
        ProductSpec <- map["ProductSpec"]
        RetailPrice <- map["RetailPrice"]
        ClassifyName <- map["ClassifyName"]
        Classify_2 <- map["Classify_2"]
        StanPrice <- map["StanPrice"]
        StanPurPrice <- map["StanPurPrice"]
        SupplierNo <- map["SupplierNo"]
        Unit <- map["Unit"]
        shopid <- map["shopid"]
        sellqty <- map["sellqty"]
        topclassifyno <- map["topclassifyno"]
        Bonus <- map["Bonus"]
    }
    
    var Bonus: Int?
    var PicAddress1: String?
    var ProductName: String?
    var ProductNo: String?
    var ProductSpec: String?
    var RetailPrice: Int?
    var ClassifyName: String?
    var Classify_2: Int?
    var StanPrice: String?
    var StanPurPrice: String?
    var SupplierNo: String?
    var Unit: String?
    var shopid: String?
    var sellqty: String?
    var topclassifyno: String?
}

class PlatformAmountModel: Mappable {
    required init?(map: Map) {
        
    }
    init() {
        
    }
    func mapping(map: Map) {
        Cash1 <- map["Cash1"]
        cash2 <- map["cash2"]
        cash3 <- map["cash3"]
        cash4 <- map["cash4"]
        ShopName <- map["ShopName"]
    }
    
    var Cash1: Float?
    var cash2: Float?
    var cash3: Float?
    var cash4: Float?
    var ShopName: String?
}

class MemberModel:Mappable {
    required init?(map: Map) {
        
    }
    init() {
        
    }
    func mapping(map: Map) {
        MS001 <- map["MS001"]
        MS002 <- map["MS002"]
        MS006 <- map["MS006"]
        MS007 <- map["MS007"]
        MS008 <- map["MS008"]
        MS030 <- map["MS030"]
        OpenID <- map["OpenID"]
        UDF06 <- map["UDF06"]
        membergrade <- map["membergrade"]
        parentid <- map["parentid"]
        parentlogourl <- map["parentlogourl"]
        parentname <- map["parentname"]
        parenttype <- map["parenttype"]
        popimgurl <- map["popimgurl"]
        redscores <- map["redscores"]
    }
    
    var MS001: String?
    var MS002: String?
    var MS006: String?
    var MS007: String?
    var MS008: String?
    var MS030: String?
    var OpenID: String?
    var UDF06: String?
    var membergrade: String?
    var parentid: String?
    var parentlogourl: String?
    var parentname: String?
    var parenttype: String?
    var popimgurl: String?
    var redscores: Int?
    
}

class ShopModel: Mappable {
    required init?(map: Map) {
        
    }
    init() {
        
    }
    func mapping(map: Map) {
        Cheapgoods <- map["Cheapgoods"]
        ClassifyName <- map["ClassifyName"]
        IsCoupon <- map["IsCoupon"]
        IsFullcut <- map["IsFullcut"]
        IsPreOrder <- map["IsPreOrder"]
        Latitude <- map["Latitude"]
        Longitude <- map["Longitude"]
        POS_RunModel <- map["POS_RunModel"]
        ShopCategory <- map["ShopCategory"]
        address <- map["address"]
        allstar <- map["allstar"]
        boroName <- map["boroName"]
        cityName <- map["cityName"]
        company <- map["company"]
        contact <- map["contact"]
        distance <- map["distance"]
        fax <- map["fax"]
        goodstar <- map["goodstar"]
        logourl <- map["logourl"]
        phone <- map["phone"]
        provName <- map["provName"]
        salesqty <- map["salesqty"]
        shopdiscount <- map["shopdiscount"]
        shopid <- map["shopid"]
        shoplabel <- map["shoplabel"]
        shopname <- map["shopname"]
        upnum <- map["upnum"]
     
    }
    
    var Cheapgoods: String?
    var ClassifyName: String?
    var IsCoupon: Bool?
    var IsFullcut: Bool?
    var IsPreOrder: Bool?
    var Latitude: String?
    var Longitude: String?
    var POS_RunModel: String?
    var ShopCategory: String?
    var address: String?
    var allstar: String?
    var boroName: String?
    var cityName: String?
    var company: String?
    var contact: String?
    var distance: String?
    var fax: String?
    var goodstar: String?
    var logourl: String?
    var phone: String?
    var provName: String?
    var salesqty: Int?
    var shopdiscount: String?
    var shopid: String?
    var shoplabel: String?
    var shopname: String?
    var upnum: Int?

}
