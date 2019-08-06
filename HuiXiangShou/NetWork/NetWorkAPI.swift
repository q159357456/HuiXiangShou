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
    case LoginStartAD
    case ShopShopClassifyList(request: String)
    case SysGetNoticeInfo(request: String)
    case ProductGoodsList(request: String)
    case ProductGoodsListByCondition(request: String)
    case SysPlatformAmount(request: String)
}


extension ApiManager: TargetType{
    var baseURL: URL {
        return URL(string: Hxs_EndPoint)!
    }

    var path: String {
        switch self {
        case .AppUserLoginByPassword(_):
           return "/Login/AppUserLoginByPassword"
        case .LoginStartAD:
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
            
        }
        
        
    }
    
    
    var method: Moya.Method {
        
        switch self {
        case .LoginStartAD:
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
        case .AppUserLoginByPassword(let request),.ShopShopClassifyList(let request), .SysGetNoticeInfo(let request), .ProductGoodsList(let request), .ProductGoodsListByCondition(let request), .SysPlatformAmount(let request):
             return .requestData(request.toData())
        case .LoginStartAD:
            return .requestParameters(parameters: ["imgtype":"78", "shopid": "000001"], encoding: URLEncoding.default)
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

