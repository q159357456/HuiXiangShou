//
//  LIButton.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/28.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
enum LIButtonType : Int{
    case leftRight
    case topBottom
    case rightLeft
}
class LIButton: UIButton {

    public var imgSize: CGSize?
    public var labelImgOffset: CGFloat?
    public var btnType: LIButtonType = .topBottom
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(.black, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.imageView == nil{
            return
        }
        if self.btnType == .topBottom {
            let imageSize: CGSize = imgSize != nil ? imgSize! : CGSize(width: self.width/2, height: self.width/2)
            
            let labeSize: CGSize = CGSize(width: self.width, height: 14)
            let offset :CGFloat = labelImgOffset != nil ? labelImgOffset! : 10.0
            let imageX: CGFloat =  (self.width - imageSize.width)/2.0
            let imageY: CGFloat = (self.height - imageSize.height - labeSize.height - offset)/2
            
            imageView?.frame = CGRect(origin: CGPoint(x: imageX, y: imageY), size: imageSize)
            titleLabel?.frame = CGRect(x: 0, y: (imageView?.frame.maxY)! + offset, width: self.width, height: labeSize.height)
            titleLabel?.textAlignment = .center
        }else if  self.btnType == .leftRight
        {
            let imageSize: CGSize = imgSize != nil ? imgSize! : CGSize(width: 40.0, height: 40.0)
            let size: CGSize = self.titleLabel?.sizeThatFits(CGSize.zero) ?? CGSize.zero
            let labeSize: CGSize = CGSize(width: size.width, height: 14)
            let offset :CGFloat = labelImgOffset != nil ? labelImgOffset! : 10.0
            let imageX: CGFloat = (self.width - imageSize.width - labeSize.width - offset)/2
            let imageY: CGFloat = (self.height - imageSize.height)/2
            imageView?.frame = CGRect(origin: CGPoint(x: imageX, y: imageY), size: imageSize)
            titleLabel?.frame = CGRect(x: (imageView?.maxX)! + offset, y: (self.height - labeSize.height)/2, width: labeSize.width, height: labeSize.height)
           
            
        }else if self.btnType == .rightLeft {
            
            let imageSize: CGSize = imgSize != nil ? imgSize! : CGSize(width: 40.0, height: 40.0)
            let size: CGSize = self.titleLabel?.sizeThatFits(CGSize.zero) ?? CGSize.zero
            let labeSize: CGSize = CGSize(width: size.width, height: 14)
            let offset :CGFloat = labelImgOffset != nil ? labelImgOffset! : 10.0
            let labelX: CGFloat = (self.width - imageSize.width - labeSize.width - offset)/2
            titleLabel?.frame = CGRect(x: labelX, y: (self.height - labeSize.height)/2, width: labeSize.width, height: labeSize.height)
            imageView?.frame = CGRect(origin: CGPoint(x: (titleLabel?.maxX)! + offset, y: (self.height - imageSize.height)/2), size: imageSize)
           
        }
       

    }
}
