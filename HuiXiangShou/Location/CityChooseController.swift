//
//  CityChooseController.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/9.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import PromiseKit
class CityChooseController: BaseViewController{
    lazy var tableView: UITableView = {
        let table: UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: W_Scale(x: 100), height: SCREEN_HEIGHT - kNavigationBarHeight), style: .plain)
        table.regist(UITableViewCell.self)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    lazy var collectionView: UICollectionView = {
        let w: CGFloat = SCREEN_WIDTH - W_Scale(x: 100)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (w - 30)/2, height: 50)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection: UICollectionView = UICollectionView(frame: CGRect(x: self.tableView.maxX, y: 0, width: SCREEN_WIDTH - W_Scale(x: 100), height: self.tableView.height), collectionViewLayout: layout)
        collection.regist(CityChooseCollectionCell.self)
        collection.backgroundColor = MainBgColor
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    var prolist = [ProvinceInfo]()
    var citylist = [CityInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.collectionView)
        _ = getProvinceInfo().done({ (prodata) in
            self.prolist = prodata
            self.tableView.reloadData()
            self.tableView(self.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        })
        // Do any additional setup after loading the view.
    }
    

}

extension CityChooseController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.prolist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.getRecycleCell(UITableViewCell.self)
        let proinfo: ProvinceInfo = self.prolist[indexPath.row]
        cell.textLabel?.text = proinfo.provName
        cell.textLabel?.font = hxs_lightFont
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let proinfo: ProvinceInfo = self.prolist[indexPath.row]
        _ = getCityCode(proinfo.provCode ?? "", "").done{ citydata  in
            self.citylist = citydata
            print(self.citylist)
            self.collectionView.reloadData()
        }
    }
    
    
}


extension CityChooseController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.citylist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CityChooseCollectionCell = collectionView.getRecycleCell(indexPath, CityChooseCollectionCell.self)
        let citymmodel: CityInfo = self.citylist[indexPath.item]
        cell.label.text  = citymmodel.cityName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let citymmodel: CityInfo = self.citylist[indexPath.item]
        print(citymmodel)
    }
}


class CityChooseCollectionCell: UICollectionViewCell {
    let label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(label)
        self.contentView.backgroundColor = .white
        label.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        label.font = hxs_lightFont
        label.textAlignment = .center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
