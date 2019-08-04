//
//  MineViewController.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/27.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import RxSwift
class MineViewController: BaseViewController {
    fileprivate lazy var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        let button: UIButton = UIButton.init(type: .custom)
        button.backgroundColor = UIColor.yellow
        button.setTitle("退出登录", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = self.view.center
        self.view.addSubview(button)
        button.rx.tap.subscribe { (element) in
            kUserDefaults.removeObject(forKey: TokenKey)
            kNotificationPost(name: LoginChanel)
            }.disposed(by: bag)
      
       
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
