//
//  ProCollectionViewCell.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/7/29.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

class ProCollectionViewCell: UICollectionViewCell {
    let imgView: UIImageView?
    let label1: UILabel?
    let label2: UILabel?
    
    override init(frame: CGRect) {
        imgView = UIImageView()
        label1 = UILabel()
        label2 = UILabel()
        super.init(frame: frame)
       
        self.contentView.addSubview(imgView!)
        self.contentView.addSubview(label1!)
        self.contentView.addSubview(label2!)
        imgView?.backgroundColor = UIColor.red
        label1?.backgroundColor = UIColor.red
        label2?.backgroundColor = UIColor.red
        
        imgView?.snp.makeConstraints({ (make) in
            make.size.equalTo(CGSize(width: W_Scale(x: 170), height: W_Scale(x: 170)))
            make.top.equalTo(self.contentView)
            make.left.equalTo(self.contentView)
        })
        
        label1?.snp.makeConstraints({ (make) in
            make.top.equalTo(imgView?.snp_bottom ?? 0)
            make.left.equalTo(self.contentView)
            make.right.equalTo(self.contentView)
            make.height.equalTo(W_Scale(x: 18))
            
        })
        
        label2?.snp.makeConstraints({ (make) in
            make.top.equalTo(label1?.snp_bottom ?? 0)
            make.left.equalTo(self.contentView)
            make.right.equalTo(self.contentView)
            make.height.equalTo(W_Scale(x: 18))
        })
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
