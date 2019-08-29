//
//  ThemeTitleView.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/7/29.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

class ThemeTitleView: UIView {

    let label: UILabel?
    let button: UIButton?
    
    override init(frame: CGRect) {
        label = UILabel()
        button = UIButton(type: .custom)
        super.init(frame: frame)
        self.backgroundColor = .white
        label?.frame = CGRect(x: 10, y: 0, width: W_Scale(200), height: self.height)
        button?.frame = CGRect(x: self.width-10-50, y: (self.height-25)/2, width: 55, height: 25)
        button?.setTitle("更多>>", for: .normal)
        button?.titleLabel?.font = kSystemFont(font: 14)
        button?.setTitleColor(.lightGray, for: .normal)
        self.addSubview(label!)
        self.addSubview(button!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
