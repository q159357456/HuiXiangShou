//
//  LoginViewController.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/28.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Moya
import ObjectMapper
class LoginViewController: UIViewController {
     fileprivate lazy var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        let button: UIButton = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.red
        button.setTitle("登录", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = self.view.center
        self.view.addSubview(button)
        button.rx.tap.subscribe(onNext: { (element) in
            let requset = RequestBaseModel()
            requset.sign = "string"
            requset.dataList.mobile = "13326859806"
            requset.dataList.password = "123456"
            let reqs: String = requset.toJSONString()!
            let provider = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: self.view),
                                                              RequestCodeHnadlePlugin()])
            _ = requestAPI(provider, .AppUserLoginByPassword(request: reqs)).done { (data) in
            
                guard let temp = data?["data"] as? [String: Any], let token = temp["token"] as? String else{
                     return
                }
                kUserDefaults.set(token, forKey: TokenKey)
                
                guard let temp1 = data?["data"] as? [String: Any], let user = temp1["data"] as? [String: Any] else{
                     return
                }
               
//                kAppDelegate.userModel = Mapper<UserModel>().map(JSON: user)
                guard let shopid = user["MS001"] as? String else{
                    return
                }
              
                kUserDefaults.set(shopid, forKey: Hxs_Shopid)
                kNotificationPost(name: LoginChanel)
            }
           
        }).disposed(by: bag)
        
     
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
