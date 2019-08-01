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
    case login(request: String)
}


extension ApiManager: TargetType{
    var baseURL: URL {
        return URL(string: Hxs_EndPoint)!
    }
    
    var path: String {
        return "/Login/AppUserLoginByPassword"
    }
    
    var method: Moya.Method {
        
        return .post
    }
    
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .login(let request):
             return .requestJSONEncodable(request)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}

