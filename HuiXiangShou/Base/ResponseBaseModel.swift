//
//  ResponseBaseModel.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/1.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import ObjectMapper
class ResponseBaseModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        MS001 <- map["MS001"]
        MS002 <- map["MS002"]
        MS003 <- map["MS003"]
        MS004 <- map["MS004"]
        MS005 <- map["MS005"]
        MS006 <- map["MS006"]
        MS007 <- map["MS007"]
        MS008 <- map["MS008"]
        MS009 <- map["MS009"]
        MS010 <- map["MS010"]
        MS011 <- map["MS011"]
        MS012 <- map["MS012"]
        MS013 <- map["MS013"]
        MS014 <- map["MS014"]
        MS015 <- map["MS015"]
        MS016 <- map["MS016"]
        MS017 <- map["MS017"]
        MS018 <- map["MS018"]
        MS019 <- map["MS019"]
        MS020 <- map["MS020"]
        MS021 <- map["MS021"]
        MS022 <- map["MS022"]
        MS023 <- map["MS023"]
        MS024 <- map["MS024"]
        MS025 <- map["MS025"]
        MS026 <- map["MS026"]
        MS027 <- map["MS027"]
        MS028 <- map["MS028"]
        MS029 <- map["MS029"]
        MS030 <- map["MS030"]
        MS031 <- map["MS031"]
        MS032 <- map["MS032"]
        MS033 <- map["MS033"]
        MS034 <- map["MS034"]
        MS035 <- map["MS035"]
        MS036 <- map["MS036"]
        MS037 <- map["MS037"]
        MS038 <- map["MS038"]
        
        UDF01 <- map["UDF01"]
        UDF02 <- map["UDF02"]
        UDF03 <- map["UDF03"]
        UDF04 <- map["UDF04"]
        UDF05 <- map["UDF05"]
        UDF06 <- map["UDF06"]
        UDF07 <- map["UDF07"]
        UDF08 <- map["UDF08"]
        UDF09 <- map["UDF09"]
        UDF10 <- map["UDF10"]
        UDF11 <- map["UDF11"]
        UDF12 <- map["UDF12"]
    }
    
    
    var MS001: String?
    var MS002: String?
    var MS003: String?
    var MS004: String?
    var MS005: String?
    var MS006: String?
    var MS007: String?
    var MS008: String?
    var MS009: String?
    var MS010: String?
    var MS011: String?
    var MS012: String?
    var MS013: String?
    var MS014: String?
    var MS015: String?
    var MS016: String?
    var MS017: String?
    var MS018: String?
    var MS019: String?
    var MS020: String?
    var MS021: String?
    var MS022: String?
    var MS023: String?
    var MS024: String?
    var MS025: String?
    var MS026: String?
    var MS027: String?
    var MS028: String?
    var MS029: String?
    var MS030: String?
    var MS031: String?
    var MS032: String?
    var MS033: String?
    var MS034: String?
    var MS035: String?
    var MS036: String?
    var MS037: String?
    var MS038: String?
    
    var UDF01: String?
    var UDF02: String?
    var UDF03: String?
    var UDF04: String?
    var UDF05: String?
    var UDF06: String?
    var UDF07: String?
    var UDF08: String?
    var UDF09: String?
    var UDF10: String?
    var UDF11: String?
    var UDF12: String?
    
    
    
}
