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
//
//func requestAPI<T>(_ provider: MoyaProvider<T>, _ target: T) -> Promise<[String: Any]> {
//    return Promise(resolver: { (resolver) in
//        provider.request(target, completion: { (result) in
//            switch result{
//            case let .success(response):
//
//            case let .failure(eroor):
//                resolver.reject(eroor)
//
//            }
//        })
//    })
//}

//func CallApi(_ target: ZhihuAPI, isCached: Bool = false) -> Promise<[String : Any]> {
//
//    let cacheKey = "dictionary:" + target.path
//
//    // 优先获取缓存
//    if isCached, let jsonString = globalCache[cacheKey] {
//        return Promise<[String : Any]> { fulfill, reject in
//            do {
//                let data = try JSONSerialization.jsonObject(with: jsonString.data(using: String.Encoding.utf8.rawValue)!, options: []) as? [String: Any]
//
//                print("fetch from cache")
//                fulfill(data!)
//            } catch {
//                reject(error)
//            }
//        }
//    }
//
//    let provider = MoyaProvider<ZhihuAPI>()
//
//    return Promise<[String : Any]> { fulfill, reject in
//        provider.request(target, completion: { (result) in
//            switch result {
//            case let .success(response):
//                do {
//                    // 缓存
//                    try globalCache.setObject(response.mapString() as NSString, forKey: cacheKey, expires: cacheExpireDate)
//
//                    print("fetch from request")
//                    let data = try JSONSerialization.jsonObject(with: response.data, options: []) as! [String: Any]
//                    fulfill(data)
//                } catch {
//                    reject(error)
//                }
//            case let .failure(error):
//                reject(error)
//            }
//        })
//    }
//}
//
///// 调用接口，成功返回模型数组
/////
///// - Parameter target:
///// - Returns:
//func CallApi<T: HandyJSON>(_ target: ZhihuAPI) -> Promise<[T?]?> {
//
//    let provider = MoyaProvider<ZhihuAPI>()
//
//    return Promise<[T?]?> { fulfill, reject in
//        provider.request(target, completion: { (result) in
//            switch result {
//            case let .success(response):
//                do {
//                    let data = try [T].deserialize(from: response.mapString())
//                    fulfill(data)
//                } catch {
//                    reject(error)
//                }
//            case let .failure(error):
//                reject(error)
//            }
//        })
//    }
//}
//
//
///// 调用接口，成功返回模型
/////
///// - Parameter target:
///// - Returns:
//func CallApi<T: HandyJSON>(_ target: ZhihuAPI) -> Promise<T> {
//
//    let provider = MoyaProvider<ZhihuAPI>()
//
//    return Promise<T> { fulfill, reject in
//        provider.request(target, completion: { (result) in
//            switch result {
//            case let .success(response):
//                do {
//                    let data = try T.deserialize(from: response.mapString())
//                    fulfill(data!)
//                } catch {
//                    reject(error)
//                }
//            case let .failure(error):
//                reject(error)
//            }
//        })
//    }
//}

//firstly { () -> Promise<[String: Any]> in
//    return CallApi(ZhihuAPI.latest, isCached: true)
//    }.then { [weak self] (result) -> Void in
//        self?.textView.text = "\(result)"
//}
