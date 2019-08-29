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

//省
func getProvinceInfo() -> Promise<[ProvinceInfo]>{
    
    let provider1 = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: kAppDelegate.window!)])
    let req: Promise<[ProvinceInfo]> = requestObjListAPI(provider1, ProvinceInfo.self, .SysGetProviceInfo)
    return req

}

//市

func getCityInfo(_ provCode: String, _ cityName: String) -> Promise<[CityInfo]>{
    let provider1 = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: kAppDelegate.window!)])
    let req:Promise<[CityInfo]> = requestObjListAPI(provider1, CityInfo.self, .SysGetCityInfo(provCode: provCode, cityName: cityName))
    return req

}

//镇区资料//360800
func getTownInfo(_ cityCode: String) -> Promise<[TownInfo]>{
    let provider1 = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: kAppDelegate.window!)])
    let req: Promise<[TownInfo]> = requestObjListAPI(provider1, TownInfo.self, .SysGetTownInfo(cityCode: cityCode))
    return req
}

//大类
func getClassify() -> Promise<[ClassifyModel]>{
    let provider1 = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: kAppDelegate.window!)])
    let base1: RequestBaseModel = RequestBaseModel()
    base1.sign = Hfx_Sign(params: nil, time: base1.timestamp)
    let req: Promise<[ClassifyModel]> = requestObjListAPI(provider1, ClassifyModel.self, .ShopShopClassifyList(request: base1.toJSONString()!))
    return req
    
}
