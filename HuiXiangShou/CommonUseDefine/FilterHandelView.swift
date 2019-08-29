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
    
    var selfBlock: ((Any)->Void)?
    var btnList = [LIButton]()
    lazy var filType1: FilterType1View = {
        let rect: CGRect = convert(self.frame, to: kAppDelegate.window)
        let temp = FilterType1View.init(rect.maxY)
        return temp
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addFuntion(_ funType: FilterType, _ block: @escaping (Any) -> Void) {
        let btn: LIButton = LIButton(frame: CGRect.zero)
        btn.setTitle(funType.rawValue, for: .normal)
        btn.btnType = .rightLeft
        btn.imgSize = CGSize(width: 15, height: 15)
        btn.labelImgOffset = 2
        btn.titleLabel?.font = hxs_lightFont
        self.btnList.append(btn)
        self.addSubview(btn)
        selfBlock = block
        switch funType {
        case .AllCity:
            btn.setImage(kGetImage(name: "filter_1"), for: .normal)
            btn.addTarget(self, action: #selector(AllCityAction(_:)), for: .touchUpInside)
            break
        case .Classify:
            btn.setImage(kGetImage(name: "filter_1"), for: .normal)
            btn.addTarget(self, action: #selector(ClassifyAction(_:)), for: .touchUpInside)
            break
        case .Rank:
            btn.setImage(kGetImage(name: "filter_1"), for: .normal)
            btn.addTarget(self, action: #selector(RankAction(_:)), for: .touchUpInside)
            break
        case .BusinessArea:
            btn.setImage(kGetImage(name: "filter_1"), for: .normal)
            btn.addTarget(self, action: #selector(BusinessAreaAction(_:)), for: .touchUpInside)
            break
        case .Composite:
            btn.setImage(Hxs_PlaceHloder, for: .normal)
            btn.addTarget(self, action: #selector(CompositeActio(_:)), for: .touchUpInside)
            break
        case .Integral:
            btn.setImage(Hxs_PlaceHloder, for: .normal)
            btn.addTarget(self, action: #selector(IntegralActio(_:)), for: .touchUpInside)
            break
        case .SalesVolume:
            btn.setImage(Hxs_PlaceHloder, for: .normal)
            btn.addTarget(self, action: #selector(SalesVolumeAction(_:)), for: .touchUpInside)
            break
        case .Filter:
            btn.setImage(Hxs_PlaceHloder, for: .normal)
            btn.addTarget(self, action: #selector(FilterAction(_:)), for: .touchUpInside)
            break
        }
        
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard self.btnList.count != 0 else {
            return
        }
        let w: CGFloat = self.width/CGFloat(self.btnList.count)
        let h: CGFloat = self.height
        var count :CGFloat = 0.0
        for btn in self.btnList {
            btn.frame = CGRect(x: w * count, y: 0, width: w, height: h)
            count += 1
        }
        
        
    }
}

//MARK: - action
extension FilterHandelView{

    @objc func AllCityAction(_ btn: UIButton) {
        _ = getTownInfo(DefaultCity.cityCode!).done({ (data) in
            self.filType1.lsitdata =  data
            self.filType1.show {[weak self]  (tdata, name) in
                btn.setTitle(name, for: .normal)
                self?.selfBlock?(tdata)
            }
        })
     
        
    }
    @objc func ClassifyAction(_ btn: UIButton) {
        _ = getClassify().done({ (data) in
            self.filType1.lsitdata =  data
            self.filType1.show {[weak self]  (tdata, name) in
                 btn.setTitle(name, for: .normal)
                self?.selfBlock?(tdata)
            }
        })
    }
    @objc func RankAction(_ btn: UIButton) {
        self.filType1.lsitdata =  ["距离(默认)", "优惠折扣"]
        self.filType1.show {[weak self]  (tdata, name) in
            btn.setTitle(name, for: .normal)
            self?.selfBlock?(tdata)
        }
    }
    @objc func BusinessAreaAction(_ btn: UIButton) {
        self.filType1.lsitdata =  ["全部商圈"]
        self.filType1.show {[weak self]  (tdata, name) in
            btn.setTitle(name, for: .normal)
            self?.selfBlock?(tdata)
        }
    }
    @objc func CompositeActio(_ btn: UIButton) {
        selfBlock?("CompositeActio")
    }
    @objc func IntegralActio(_ btn: UIButton) {
        selfBlock?("IntegralActio")
    }
    @objc func SalesVolumeAction(_ btn: UIButton) {
        selfBlock?("SalesVolumeAction")
    }
    @objc func FilterAction(_ btn: UIButton) {
        selfBlock?("FilterAction")
    }
}



class FilterType1View: UIView {
    
    var tableView: UITableView?
    var lsitdata: [Any]?{
        didSet{
            self.tableView?.height = CGFloat(lsitdata!.count) * 44.0 <= 250.0 ? CGFloat(lsitdata!.count) * 44.0 : 250.0
            self.tableView?.reloadData()
        }
    }
    var filtype1CallBack: ((Any, String)->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(_ top: CGFloat) {
        self.init(frame: (kAppDelegate.window?.bounds)!)
        backgroundColor = .init(white: 0.4, alpha: 0.8)
        tableView = UITableView.init(frame: CGRect(x: 0, y: top, width: SCREEN_WIDTH, height: 0), style: .plain)
        tableView?.regist(UITableViewCell.self)
        tableView?.rowHeight = 44.0
        tableView?.delegate = self
        tableView?.dataSource = self
        addSubview(tableView!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }
    
    func show(_ block: @escaping (Any, String) -> Void) {
        self.filtype1CallBack = block
        kAppDelegate.window?.addSubview(self)
    }
}

extension FilterType1View: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lsitdata?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getRecycleCell(UITableViewCell.self)
        cell.textLabel?.font = kSystemFont(font: 15)
        if self.lsitdata?[indexPath.row].self is TownInfo{
            let town: TownInfo = self.lsitdata?[indexPath.row] as!  TownInfo
            cell.textLabel?.text = town.boroName
        }
        
        if self.lsitdata?[indexPath.row].self is ClassifyModel{
            let classmodel: ClassifyModel = self.lsitdata?[indexPath.row] as!  ClassifyModel
            cell.textLabel?.text = classmodel.ClassifyName
        }
        
        if self.lsitdata?[indexPath.row].self is String {
            cell.textLabel?.text =  self.lsitdata?[indexPath.row] as? String
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var temp: String = ""
        if self.lsitdata?[indexPath.row].self is TownInfo{
            let town: TownInfo = self.lsitdata?[indexPath.row] as!  TownInfo
            temp = town.boroName ?? ""
        }
        
        if self.lsitdata?[indexPath.row].self is ClassifyModel{
            let classmodel: ClassifyModel = self.lsitdata?[indexPath.row] as!  ClassifyModel
            temp = classmodel.ClassifyName ?? ""
        }
        
        if self.lsitdata?[indexPath.row].self is String {
            temp =  self.lsitdata?[indexPath.row] as? String ?? ""
        }

        self.filtype1CallBack?(self.lsitdata?[indexPath.row] ?? "none", temp)
        self.removeFromSuperview()
    }
    
}
