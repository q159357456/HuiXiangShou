//
//  StoreViewController.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/27.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import PromiseKit
import Moya
class StoreViewController: BaseViewController {
    var dataArray = [ClassfyWithProModel]()
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.width, height: self.view.height - kNavigationBarHeight), style: .grouped)
        tableView.register(ProListTableViewCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(ProListTableViewCell.classForCoder()))
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var cycleView: CyclePlayView = {
        let cycleview: CyclePlayView  = CyclePlayView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH/2), direction: .lelt)
        cycleview.cycleViewContent = .imgModel
        cycleview.pictures = ["placeHolder","placeHolder","placeHolder","placeHolder"];
        return cycleview
    }()

    lazy var topView: UIView = {
        let imaglist: [String] = ["placeHolder","placeHolder","placeHolder"]
        let titlelist: [String] = ["0.0积分","兑换记录","全部商品"]
        let view: UIView = UIView(frame: CGRect(x: 0, y: self.cycleView.maxY, width: SCREEN_WIDTH, height: 50))
        view.backgroundColor = .white
        for inx in 0..<imaglist.count {
            let w: CGFloat = SCREEN_WIDTH/CGFloat(imaglist.count)
            
            let btn: LIButton = LIButton(frame: CGRect(x: w*CGFloat(inx), y: 0, width: w, height: view.height))
            btn.tag  = inx + 1
            btn.setImage(kGetImage(name: imaglist[inx]), for: .normal)
            btn.setTitle(titlelist[inx], for: .normal)
            btn.imgSize = CGSize(width: 30, height: 30)
            btn.btnType = .leftRight
            btn.labelImgOffset = 5
            btn.titleLabel?.font = hxs_lightFont
            view.addSubview(btn)
            
        }
        
        return view
        
    }()
    
    lazy var tableHeaderView: UIView = {
        let line: UIView = UIView(frame: CGRect(x: 0, y: self.topView.maxY, width: SCREEN_WIDTH, height: 8))
        line.backgroundColor = UIColor.groupTableViewBackground
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: line.maxY))
        view.addSubview(self.cycleView)
        view.addSubview(self.topView)
        view.addSubview(line)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableHeaderView = self.tableHeaderView
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(self.tableView)
        netWorking()
        
        // Do any additional setup after loading the view.
    }

}

//MARK: - UITableViewDataSource,UITableViewDelegate
extension StoreViewController: UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        var count: Int = 0
        let temp = self.dataArray
        for obj in temp {
            if  obj.goodslist != nil && obj.goodslist!.count > 0{
                count += 1
            }else
            {
                self.dataArray.remove(at: count)
            }
        }
        
        return count
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let classModel: ClassfyWithProModel = self.dataArray[indexPath.section]
        let cell:ProListTableViewCell = tableView.getRecycleCell(ProListTableViewCell.self)
        cell.dataList = classModel.goodslist
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProListTableViewCell.rowForHeight()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let classModel: ClassfyWithProModel = self.dataArray[section]
        let view: ThemeTitleView = ThemeTitleView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 40))
        view.label?.text = classModel.ClassifyName
        
        return view
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
         return UIView()
    }

}
// MARK: - NET
extension StoreViewController{
    func netWorking()  {
       _ = getPicCycleData(key: "79").done { (data) in
        var templist = [String]()
        for obj in data{
            templist.append(obj.PicAddress1 ?? "")
        }
        self.cycleView.pictures = templist
        
       }
        
        _ = getMemberInfo().done { (data) in
            
            let button : LIButton = self.topView.viewWithTag(1) as! LIButton
            button.setTitle("\(data.redscores ?? 0)积分", for: .normal)
            
        }
        
        let  base: RequestBaseModel = RequestBaseModel()
        base.sign = Hfx_Sign(params: nil, time: base.timestamp)
        let provider = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: self.view)])
        _ = requestObjListAPI(provider, ClassfyWithProModel.self, .ProductGoodsListByClassify(request: base.toJSONString()!)).done({ (data) in
            self.dataArray = data
            self.tableView.reloadData()
        })
      
    }
    
}
