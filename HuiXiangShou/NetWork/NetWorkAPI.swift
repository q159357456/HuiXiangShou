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
    case login(username:String,password:String,token:String)
}


extension ApiManager: TargetType{
    var baseURL: URL {
        return URL(string: HxsEndpoint)!
    }
    
    var path: String {
        switch self {
        case .login(username: _, password: _, token: _):
            return "66"
        default:
            return "666"
            
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["token" : "token"]
    }
    
    
    
}



