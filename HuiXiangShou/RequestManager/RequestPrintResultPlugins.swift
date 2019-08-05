//
//  RequestPrintResultPlugins.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/8/3.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import Moya
import Result
class RequestPrintResultPlugin: PluginType {
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        if case let Result.success(response) = result {
            print("\(target.method) \(target.baseURL)\((target.path))")
            print(response.data.toDic() ?? "啥都没返回")
        }
 
    }
}
