//
//  HotComboView.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/28.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

class HotComboView: UIView {
    var imgView: UIImageView?
    var label1: UILabel;
    var label2: UILabel;
    
    override init(frame: CGRect) {
        imgView = UIImageView()
        label1 = UILabel()
        label2 = UILabel()
        super.init(frame: frame)
        self.addSubview(imgView!)
        self.addSubview(label1)
        self.addSubview(label2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
