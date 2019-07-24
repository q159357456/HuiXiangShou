//
//  ViewController.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/7/23.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import RxSwift
class ViewController: UIViewController {
    fileprivate lazy var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        let button: UIButton = UIButton.init(type: .custom)
        button.addTarget(self, action: #selector(btn1Click(btn:)), for: .touchUpInside)
        button.backgroundColor = UIColor.red
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = self.view.center
        self.view.addSubview(button)
        
    
        // Do any additional setup after loading the view.
    }

    @objc func btn1Click(btn: UIButton) -> Void {
        print("shishikan")
    }
   
}

