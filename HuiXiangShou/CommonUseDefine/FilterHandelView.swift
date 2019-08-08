//
//  FilterHandelView.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/8.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
enum FilterType: String {
    case AllCity = "全城"
    case Classify = "分类"
    case Rank     = "排序"
    case BusinessArea  = "商圈"
    case Composite  = "综合"
    case Integral  = "积分"
    case SalesVolume = "销量"
    case Filter = "筛选"
}
class FilterHandelView: UIView {

    var selfBlock: (()->Void)?
    var btnList = [LIButton]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addFuntion(_ funType: FilterType, _ block: @escaping () -> Void) {
        let btn: LIButton = LIButton(frame: CGRect.zero)
        btn.setTitle(funType.rawValue, for: .normal)
        self.btnList.append(btn)
        selfBlock = block
        switch funType {
            case .AllCity:
                btn.setImage(Hxs_PlaceHloder, for: .normal)
            break
            case .Classify:
                btn.setImage(Hxs_PlaceHloder, for: .normal)
            break
            case .Rank:
                btn.setImage(Hxs_PlaceHloder, for: .normal)
            break
            case .BusinessArea:
                btn.setImage(Hxs_PlaceHloder, for: .normal)
            break
            case .Composite:
                btn.setImage(Hxs_PlaceHloder, for: .normal)
            break
            case .Integral:
                btn.setImage(Hxs_PlaceHloder, for: .normal)
            break
            case .SalesVolume:
                btn.setImage(Hxs_PlaceHloder, for: .normal)
            break
            case .Filter:
                btn.setImage(Hxs_PlaceHloder, for: .normal)
            break
        }
            
        
    }
    
    
    override func layoutSubviews() {
        
    }
}

//MARK: - action
extension FilterHandelView{
    
    func AllCityAction() {
        
    }
    func ClassifyAction() {
        
    }
    func RankAction() {
        
    }
    func BusinessAreaAction() {
        
    }
    func Composite() {
        
    }
    func Integral() {
        
    }
    func SalesVolumeAction() {
        
    }
    func FilterAction() {
        
    }
}


