//
//  CommonUseNetWork.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/7.
//  Copyright © 2019 工博科技. All rights reserved.
//

import Foundation
import Moya
import PromiseKit
import ObjectMapper
//会员信息
func getMemberInfo() -> Promise<MemberModel>{
    let base1: RequestBaseModel = RequestBaseModel()
    base1.basedata.para1 = kUserDefaults.string(forKey: Hxs_Shopid)
    base1.sign = Hfx_Sign(params: base1.basedata.toOrderJson(), time: base1.timestamp)
    let provider1 = MoyaProvider<ApiManager>(plugins: [RequestCodeHnadlePlugin()])
    let req: Promise<MemberModel> = requestObjAPI(provider1, MemberModel.self, .MemberMemberInfo(request: base1.toJSONString()!))
    return req
}

//轮播图
func getPicCycleData(key: String) -> Promise<[CyclePicModel]>{
   
    let provider1 = MoyaProvider<ApiManager>(plugins: [RequestCodeHnadlePlugin()])
    let req: Promise<[CyclePicModel]> = requestObjListAPI(provider1, CyclePicModel.self, .LoginStartAD(key: key))
    return req
}
