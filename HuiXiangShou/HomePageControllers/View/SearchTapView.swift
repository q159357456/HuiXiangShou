//
//  SearchTapView.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/7.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

class SearchTapView: UIView {

    var callback : (() -> Void)?
    var txt: String?{
        didSet{
            self.label?.text = txt
        }
    }
    
    var label: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(_ frame: CGRect, _ block: @escaping() -> Void){
    
        self.init(frame: frame)
        self.backgroundColor = MainBgColor
        self.layer.cornerRadius = self.height/2
        self.layer.masksToBounds = true
        self.label = UILabel(frame: CGRect(x: 10, y: 0, width: width - 70, height: height))
        self.label?.font = kSystemFont(font: 15)
        self.label?.textColor = .lightGray
        self.addSubview(self.label!)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapClick))
        self.addGestureRecognizer(tap)
        
        let tipimagev: UIImageView = UIImageView(image: kGetImage(name: "search"))
        tipimagev.frame = CGRect(x: self.width - 40, y: (self.height - 20)/2, width: 20, height: 20)
        self.addSubview(tipimagev)
        callback = block
    }
    
    
    
    @objc func tapClick()  {
      callback?()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
