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
func requestAPI<T>(_ provider: MoyaProvider<T>, _ target: T) -> Promise<[String: Any]> {
    return Promise(resolver: { (resolver) in
        provider.request(target, completion: { (result) in
            switch result{
            case let .success(response):
                guard let dic = response.data.toDic() else{
                    return
                }
                resolver.fulfill(dic)
            case let .failure(eroor):
                resolver.reject(eroor)

            }
        })
    })
}

func requestObjAPI<T,U: Mappable>(_ provider: MoyaProvider<T>, _ model: U.Type , _ target: T) -> Promise<U> {
    return Promise(resolver: { (resolver) in
        provider.request(target, completion: { (result) in
            switch result{
            case let .success(reponse):
                let dic: [String: Any]? = reponse.data.toDic()
                guard let temp1 = dic?["data"] as? [String: Any] else{
                    return
                }
                resolver.fulfill(Mapper<U>().map(JSON: temp1)!)
            case let .failure(erro):
                resolver.reject(erro)
            }
        })
    })
}

func requestObjListAPI<T,U: Mappable>(_ provider: MoyaProvider<T>, _ model: U.Type, _ target: T) -> Promise<[U]>{
    return Promise(resolver: { (resolver) in
        provider.request(target, completion: { (result) in
            switch result{
            case let .success(reponse):
                let dic: [String: Any]? = reponse.data.toDic()
                guard let temp1 = dic?["data"] as? [[String: Any]] else{
                    return
                }
                resolver.fulfill(Mapper<U>().mapArray(JSONArray: temp1))
            case let .failure(erro):
                resolver.reject(erro)
            }
        })
    })
    
}

