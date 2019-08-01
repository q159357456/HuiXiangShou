//
//  LIButton.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/28.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

class LIButton: UIButton {

    public var imgSize: CGSize?
    public var labelImgOffset: CGFloat?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.imageView == nil{
            return
        }
        
        let imageSize: CGSize = imgSize != nil ? imgSize! : CGSize(width: self.width/2, height: self.width/2)
       
        let labeSize: CGSize = CGSize(width: self.width, height: 14)
        let offset :CGFloat = labelImgOffset != nil ? labelImgOffset! : 10.0
        let imageX: CGFloat =  self.width/4
        let imageY: CGFloat = (self.height - imageSize.height - labeSize.height - offset)/2
        
        imageView?.frame = CGRect(origin: CGPoint(x: imageX, y: imageY), size: imageSize)
        titleLabel?.frame = CGRect(x: 0, y: (imageView?.frame.maxY)! + offset, width: self.width, height: labeSize.height)
        titleLabel?.textAlignment = .center

    }
}
