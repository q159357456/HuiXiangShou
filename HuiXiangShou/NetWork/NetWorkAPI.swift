//
//  NetWorkAPI.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/7/26.
//  Copyright © 2019 工博科技. All rights reserved.
//

import Foundation
import Moya
enum ApiManager {
    case AppUserLoginByPassword(request: String)
    case LoginStartAD(key: String)
    case ShopShopClassifyList(request: String)
    case SysGetNoticeInfo(request: String)
    case ProductGoodsList(request: String)
    case ProductGoodsListByCondition(request: String)
    case SysPlatformAmount(request: String)
    case MemberMemberInfo(request: String)
    case ProductGoodsListByClassify(request: String)
    case ShopShopList(request: String)
    case SysGetTownInfo(cityCode: String)
    case SysGetProviceInfo
    case SysGetCityInfo(provCode: String, cityName: String)
    case SysGetVillageInfo(townCode: String)
    case SysGetCircleInfo(cityCode: String, townCode: String, circlename: String)
}


extension ApiManager: TargetType{
    var baseURL: URL {
        return URL(string: Hxs_EndPoint)!
    }

    var path: String {
        switch self {
        case .AppUserLoginByPassword(_):
           return "/Login/AppUserLoginByPassword"
        case .LoginStartAD(_):
            return "/Login/StartAD"
        case .ShopShopClassifyList(_):
            return "/Shop/ShopClassifyList"
        case .SysGetNoticeInfo(_):
            return "/Sys/GetNoticeInfo"
        case .ProductGoodsList(_):
            return "/Product/GoodsList"
        case .ProductGoodsListByCondition(_):
            return "/Product/GoodsListByCondition"
        case .SysPlatformAmount(_):
            return "/Sys/PlatformAmount"
        case .MemberMemberInfo(_):
            return "/Member/MemberInfo"
        case .ProductGoodsListByClassify(_):
            return "/Product/GoodsListByClassify"
        case .ShopShopList(_):
            return "/Shop/ShopList_IOS"
        case .SysGetTownInfo(_):
            return "/Sys/GetTownInfo"
        case .SysGetProviceInfo:
            return "Sys/GetProviceInfo"
        case .SysGetCityInfo(_):
            return "/Sys/GetCityInfo"
        case .SysGetVillageInfo(_):
            return "/Sys/GetVillageInfo"
        case .SysGetCircleInfo(_):
            return "/Sys/GetCircleInfo"
        
        }
        
        
    }
    
    
    var method: Moya.Method {
        
        switch self {
        case .LoginStartAD(_), .SysGetTownInfo(_),.SysGetProviceInfo,.SysGetCityInfo(_), .SysGetVillageInfo(_), .SysGetCircleInfo(_):
            return .get
        default:
            return .post
        }
        
        
    }
    
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    

    var task: Task {
        switch self {
        case .AppUserLoginByPassword(let request),.ShopShopClassifyList(let request), .SysGetNoticeInfo(let request), .ProductGoodsList(let request), .ProductGoodsListByCondition(let request), .SysPlatformAmount(let request),.MemberMemberInfo(let request),.ProductGoodsListByClassify(let request),.ShopShopList(let request):
             return .requestData(request.toData())
        case .LoginStartAD(let key):
            return .requestParameters(parameters: ["imgtype":key, "shopid": "000001"], encoding: URLEncoding.default)
            
        case .SysGetTownInfo(let cityCode):
            return .requestParameters(parameters: ["cityCode":cityCode], encoding: URLEncoding.default)
            
        case .SysGetCityInfo(let provCode, let cityName):
            return .requestParameters(parameters: ["provCode":provCode, "cityName": cityName], encoding: URLEncoding.default)
        case .SysGetVillageInfo(let townCode):
            return .requestParameters(parameters: ["townCode":townCode], encoding: URLEncoding.default)
        case .SysGetCircleInfo(let cityCode, let townCode, let circlename):
            return .requestParameters(parameters: ["cityCode":cityCode, "townCode": townCode, "circlename":circlename], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
        
    
        
    }
    
    var headers: [String : String]? {
        switch self {
        case .AppUserLoginByPassword(request: _):
              return ["Content-Type": "application/json; charset=utf-8"]
            
        default:
              return ["Authorization": "Bearer \(kUserDefaults.object(forKey: TokenKey) as! String)" , "Content-Type": "application/json; charset=utf-8"]
           
        
        
        }
    }
    
    
}

