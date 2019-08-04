//
//  RequestCodeHnadlePlugin.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/8/3.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import Moya
import Result
class RequestCodeHnadlePlugin: PluginType {
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case let .success(response):
            let dic = response.data.toDic()
            if dic?["code"] as! Int != 0{
                print("错误码: \(String(describing: dic?["code"]))  错误信息: \(String(describing: dic?["message"]))")
                return
            }
            
        default:
            break
        }
    }
}
