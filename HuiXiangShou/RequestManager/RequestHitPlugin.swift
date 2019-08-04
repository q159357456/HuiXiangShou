//
//  RequestHitPlugin.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/8/3.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import Moya
import Result
class RequestHitPlugin: PluginType {

    var bgview: UIView?
    convenience init(view: UIView) {
        self.init()
        bgview = view
        
    }
    
    func willSend(_ request: RequestType, target: TargetType) {
        MBProgressHUD.showAdded(to: self.bgview!, animated: true)
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        MBProgressHUD.hide(for: self.bgview!, animated: true)
    }
}
