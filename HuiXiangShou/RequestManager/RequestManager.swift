//
//  RequestManager.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/2.
//  Copyright © 2019 工博科技. All rights reserved.
//

import Foundation
import Moya
import PromiseKit
import ObjectMapper
func requestAPI<T>(_ provider: MoyaProvider<T>, _ target: T) -> Promise<[String: Any]?> {
    return Promise(resolver: { (resolver) in
        provider.request(target, completion: { (result) in
            switch result{
            case let .success(response):
                let dic: [String: Any]? = response.data.toDic()
                resolver.fulfill(dic ?? nil)
            case let .failure(eroor):
                resolver.reject(eroor)

            }
        })
    })
}

func requestAPI<T,U: Mappable>(_ provider: MoyaProvider<T>, _ target: T) -> Promise<U?> {
    return Promise(resolver: { (resolver) in
        provider.request(target, completion: { (result) in
            switch result{
            case let .success(reponse):
                let dic: [String: Any]? = reponse.data.toDic()
                guard let temp = dic?["data"] as? [String: Any], let temp1 = temp["data"] as? [String: Any] else{
                    return
                 
                }
                resolver.fulfill(Mapper<U>().map(JSON: temp1))
            case let .failure(erro):
                resolver.reject(erro)
            }
        })
    })
}

func requestAPI<T,U: Mappable>(_ provider: MoyaProvider<T>, _ target: T) -> Promise<[U]?>{
    return Promise(resolver: { (resolver) in
        provider.request(target, completion: { (result) in
            switch result{
            case let .success(reponse):
                let dic: [String: Any]? = reponse.data.toDic()
                guard let temp = dic?["data"] as? [String: Any], let temp1 = temp["data"] as? [[String: Any]] else{
                    return
                }
                resolver.fulfill(Mapper<U>().mapArray(JSONArray: temp1))
            case let .failure(erro):
                resolver.reject(erro)
            }
        })
    })
    
}

