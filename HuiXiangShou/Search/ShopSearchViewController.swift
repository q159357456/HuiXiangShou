//
//  ShopSearchViewController.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/9.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

class ShopSearchViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let filter: FilterHandelView = FilterHandelView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 60))
        filter.addFuntion(.AllCity) { (data) in
            print(data)
        }
        
        filter.addFuntion(.Classify) { (data) in
           print(data)
        }
        
        filter.addFuntion(.Rank) { (data) in
            print(data)
        }
        
        filter.addFuntion(.BusinessArea) { (data) in
            print(data)
        }

        self.view.addSubview(filter)
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
