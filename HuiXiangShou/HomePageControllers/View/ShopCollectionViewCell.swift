//
//  ShopCollectionViewCell.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/7.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    
    var imageV: UIImageView?
    var label1: UILabel?
    var label2: UILabel?
    var label3: UILabel?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageV = UIImageView()
        self.label1 = UILabel()
        self.label2 = UILabel()
        self.label3 = UILabel()
        self.addSubview(imageV!)
        self.addSubview(label1!)
        self.addSubview(label2!)
        self.addSubview(label3!)
        self.imageV?.frame = CGRect(x: W_Scale(x: 10), y: W_Scale(x: 10), width: W_Scale(x: 80), height: W_Scale(x: 80))
        self.label1?.frame = CGRect(x: self.imageV!.maxX + W_Scale(x: 10), y: self.imageV!.y, width: self.width - imageV!.width - W_Scale(x: 20), height: 15)
        
        self.label2?.frame = CGRect(x: self.imageV!.maxX + W_Scale(x: 10), y: self.label1!.maxY, width: self.label1!.width, height: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
