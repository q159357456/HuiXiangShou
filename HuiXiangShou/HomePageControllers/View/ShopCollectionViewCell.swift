//
//  ShopCollectionViewCell.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/7.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import Kingfisher
class ShopCollectionViewCell: UICollectionViewCell {
    
    let imageV: UIImageView?
    let label1: UILabel?
    let label2: UILabel?
    let label3: UILabel?
    let hotImgV1: UIImageView = UIImageView()
    let hotImgV2: UIImageView = UIImageView()
    let hotImgV3: UIImageView = UIImageView()
    var model: ShopModel?{
        didSet{
            
            self.imageV?.kf.setImage(with: URL(string: model?.logourl ?? ""), placeholder: Hxs_PlaceHloder)
            self.label1?.text = model?.shopname
            self.label2?.text = "人气\(model?.upnum ?? 0)"
            let size: CGSize = (self.label2?.sizeThatFits(CGSize.zero))!
            self.label2?.width = size.width
            self.label3?.text = model?.shoplabel ?? "暂无标签"
            if  model != nil &&  model?.upnum != nil {
                if model!.upnum! < 30{
                    self.hotImgV1.image = kGetImage(name: "shophot_non")
                    self.hotImgV2.image = kGetImage(name: "shophot_non")
                    self.hotImgV3.image = kGetImage(name: "shophot_non")
                }
                
                if model!.upnum! >= 30 && model!.upnum! <= 60{
                    self.hotImgV1.image = kGetImage(name: "shophot_non")
                    self.hotImgV2.image = kGetImage(name: "shophot")
                    self.hotImgV3.image = kGetImage(name: "shophot")
                }
                
                if model!.upnum! >= 61 && model!.upnum! <= 89{
                    self.hotImgV1.image = kGetImage(name: "shophot_non")
                    self.hotImgV2.image = kGetImage(name: "shophot_non")
                    self.hotImgV3.image = kGetImage(name: "shophot")
                }
                
                if model!.upnum! >= 90{
                    self.hotImgV1.image = kGetImage(name: "shophot")
                    self.hotImgV2.image = kGetImage(name: "shophot")
                    self.hotImgV3.image = kGetImage(name: "shophot")
                }
            }
           
        }
    }
    
    override init(frame: CGRect) {
        self.imageV = UIImageView()
        self.label1 = UILabel()
        self.label2 = UILabel()
        self.label3 = UILabel()
        super.init(frame: frame)
        self.addSubview(imageV!)
        self.addSubview(label1!)
        self.addSubview(label2!)
        self.addSubview(label3!)
        self.addSubview(hotImgV1)
        self.addSubview(hotImgV2)
        self.addSubview(hotImgV3)
        self.label2?.textColor = .red
        self.label2?.font = kSystemFont(font: 14)
        self.label3?.font = kSystemFont(font: 14)
        self.label3?.layer.cornerRadius = 4
        self.label3?.layer.masksToBounds = true
        self.label3?.backgroundColor = HEX(hexValue: 0xD4E9A6)
        self.label3?.textColor = .white
        self.label3?.textAlignment = .center
        self.imageV?.frame = CGRect(x: W_Scale(10), y: W_Scale(10), width:  100, height: 100)
        self.label1?.frame = CGRect(x: self.imageV!.maxX + W_Scale(10), y: self.imageV!.y, width: self.width - imageV!.width - W_Scale(20), height: 15)
        self.label2?.frame = CGRect(x: self.imageV!.maxX + W_Scale(10), y: self.label1!.maxY+10, width: 60, height: 15)
        self.label3?.frame = CGRect(x: self.imageV!.maxX + W_Scale(10), y: self.label2!.maxY+10, width: 70, height: 25)
        
        self.hotImgV1.frame = CGRect(x: self.label2?.maxX ?? 0 + 5, y:self.label2?.y ?? 0 , width: 15, height: 15)
        self.hotImgV2.frame = CGRect(x: self.hotImgV1.maxX + 2 , y:self.label2?.y ?? 0 , width: 15, height: 15)
        self.hotImgV3.frame = CGRect(x: self.hotImgV2.maxX + 2, y:self.label2?.y ?? 0 , width: 15, height: 15)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
