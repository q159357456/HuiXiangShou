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
        imgView?.frame = self.bounds
        self.label1.frame = CGRect(x: 0, y: 30, width: self.width, height: 14)
        self.label2.frame = CGRect(x: 0, y: self.label1.maxY + 5, width: self.width, height: 14)
        self.label1.textAlignment = .center
        self.label2.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
