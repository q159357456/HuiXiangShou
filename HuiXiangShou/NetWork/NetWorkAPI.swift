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
        }
        
    }
    
    
    var method: Moya.Method {
        
        switch self {
        case .AppUserLoginByPassword(_), .ShopShopClassifyList(_),.SysGetNoticeInfo(_):
            return .post
        case .LoginStartAD:
            return .get
        }
    }
    
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    

    var task: Task {
        switch self {
        case .AppUserLoginByPassword(let request),.ShopShopClassifyList(let request), .SysGetNoticeInfo(let request):
             return .requestData(request.toData())
        case .LoginStartAD:
            return .requestParameters(parameters: ["imgtype":"78", "shopid": "000001"], encoding: URLEncoding.default)
        }
        
    }
    
    var headers: [String : String]? {
        switch self {
        case .AppUserLoginByPassword(request: _):
              return ["Content-Type": "application/json; charset=utf-8"]
        case .ShopShopClassifyList(request: _), .LoginStartAD, .SysGetNoticeInfo(_):
            return ["Authorization": "Bearer \(kUserDefaults.object(forKey: TokenKey) as! String)" , "Content-Type": "application/json; charset=utf-8"]
        
        
        }
    }
    
    
}

