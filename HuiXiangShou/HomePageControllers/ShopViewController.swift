//
//  ShopViewController.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/27.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import Moya
import PromiseKit
class ShopViewController: BaseViewController {
    var collectionView: UICollectionView?
    
    var dataArray = [ShopModel]()
    var cityBtn: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        let base: RequestBaseModel = RequestBaseModel()
        base.basedata.pageindex = 1
        base.basedata.pagesize = 10
        
        base.dataList.lat = CurenntCoordinate.latitude
        base.dataList.lng = CurenntCoordinate.latitude
        base.dataList.cityno = ""
        let sign: String = "\(base.basedata.toOrderJson()!)&\(base.dataList.toOrderJson()!)"
        base.sign = Hfx_Sign(params: sign, time: base.timestamp)

        let provider = MoyaProvider<ApiManager>(plugins: [RequestCodeHnadlePlugin(), RequestHitPlugin(view: self.view)])
        
        _ = requestObjListAPI(provider, ShopModel.self, .ShopShopList(request: base.toJSONString()!)).done({ (data) in
            self.dataArray.append(contentsOf: data)
            self.collectionView?.reloadData()
        })
        // Do any additional setup after loading the view.
    }
    

}

extension ShopViewController{
    
    func setUI() {
        let topview: UIView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 50))
        let secondView: UIView = UIView(frame: CGRect(x: 0, y: topview.maxY, width: SCREEN_WIDTH, height: 50))
        topview.backgroundColor = .white
        secondView.backgroundColor = MainBgColor
        self.view.addSubview(topview)
        self.view.addSubview(secondView)
        
        let btn: UIButton = UIButton(type: .custom)
        
        btn.frame = CGRect(x: 10, y: 10, width: 60, height: 30)
        btn.setTitle(DefaultCity.cityName!, for: .normal)
        btn.addTarget(self, action: #selector(chooseCity), for: .touchUpInside)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = kSystemFont(font: 15)
        topview.addSubview(btn)
        self.cityBtn = btn
        let search: SearchTapView = SearchTapView.init(CGRect(x: 80, y: 10, width: topview.width - 130, height: 30)) {
            let vc: ShopSearchViewController = ShopSearchViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
      
        search.txt = "搜索商品"
        topview.addSubview(search)
        
        let label: UILabel = UILabel(frame: CGRect(x: 10, y: 0, width: secondView.width-10, height: secondView.height))
        label.text = "为你定制 / 附近门店"
        secondView.addSubview(label)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: SCREEN_WIDTH - 20, height: 130)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collection: UICollectionView = UICollectionView(frame: CGRect(x: 0, y: secondView.maxY, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - secondView.maxY - kNavigationBarHeight - kTabBarHeight), collectionViewLayout: layout)
        self.view.addSubview(collection)
        self.collectionView = collection
        self.collectionView?.regist(ShopCollectionViewCell.self)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self 
        self.collectionView?.backgroundColor = MainBgColor
    }
    
    
    
}

extension ShopViewController: UICollectionViewDelegate , UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ShopCollectionViewCell = collectionView.getRecycleCell(indexPath, ShopCollectionViewCell.self)
        let model: ShopModel = self.dataArray[indexPath.item]
        cell.backgroundColor = .white
        cell.model = model
        return cell
        
    }
}

//MARK: -action
extension ShopViewController{
    
    @objc func chooseCity()  {
        let vc = CityChooseController()
        vc.callBack = {[weak self]  (data: CityInfo) in
            self?.cityBtn?.setTitle(data.cityName, for: .normal)
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
