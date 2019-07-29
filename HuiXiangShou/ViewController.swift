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
        
    
        // Do any additional setup after loading the view.
    }

    @objc func btn1Click(btn: UIButton) -> Void {
        print("shishikan")
    }
   
}

