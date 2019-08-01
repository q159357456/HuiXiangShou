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
class LoginViewController: UIViewController {
     fileprivate lazy var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        let button: UIButton = UIButton.init(type: .custom)
        //        button.addTarget(self, action: #selector(btn1Click(btn:)), for: .touchUpInside)
        button.backgroundColor = UIColor.red
        button.setTitle("登录", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = self.view.center
        self.view.addSubview(button)
        button.rx.tap.subscribe(onNext: { (element) in
            kUserDefaults.set(true, forKey: LoginStatuKey)
            kNotificationPost(name: LoginChanel)
        }).disposed(by: bag)
        
        let dic = ["age": 17, "username": "梅梅",
                   "best_friend": ["age": 18, "username": "李雷"]]
        
            as [String : Any]
        
        let user: UserModel = UserModel()
 
        
        
        
        
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
