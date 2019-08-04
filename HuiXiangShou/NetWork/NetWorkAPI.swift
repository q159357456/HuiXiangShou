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
}


extension ApiManager: TargetType{
    var baseURL: URL {
        return URL(string: Hxs_EndPoint)!
    }
    
    var path: String {
        switch self {
        case .AppUserLoginByPassword(_):
           return "/Login/AppUserLoginByPassword"
        }
        
    }
    
    var method: Moya.Method {
        
        return .post
    }
    
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .AppUserLoginByPassword(let request):
             return .requestData(request.toData())
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json; charset=utf-8"]
    }
    
    
}

