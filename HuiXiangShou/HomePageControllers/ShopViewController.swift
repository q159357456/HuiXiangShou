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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        let base: RequestBaseModel = RequestBaseModel()
        base.basedata.pageindex = 1
        base.basedata.pagesize = 10
        base.dataList.lat = 39.922705
        base.dataList.lng = 116.416637
        base.dataList.cityno = ""
        let sign: String = "\(base.basedata.toOrderJson()!)&\(base.dataList.toOrderJson()!)"
        
        base.sign = Hfx_Sign(params: sign, time: base.timestamp)
  
        let provider = MoyaProvider<ApiManager>(plugins: [RequestCodeHnadlePlugin(), RequestPrintResultPlugin(), RequestHitPlugin(view: self.view)])
        
        _ = requestAPI(provider, .ShopShopList(request: base.toJSONString()!))
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ShopViewController{
    
    func setUI() {
        let topview: UIView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 50))
        let secondView: UIView = UIView(frame: CGRect(x: 0, y: topview.maxY, width: SCREEN_WIDTH, height: 50))
        topview.backgroundColor = .white
        secondView.backgroundColor = MainBgColor
        self.view.addSubview(topview)
        self.view.addSubview(secondView)
        let search: SearchTapView = SearchTapView.init(CGRect(x: 50, y: 10, width: topview.width - 100, height: 30)) {
            
        }
        search.txt = "搜索商品"
        topview.addSubview(search)
        
        let label: UILabel = UILabel(frame: CGRect(x: 10, y: 0, width: secondView.width-10, height: secondView.height))
        label.text = "为你定制 / 附近门店"
        secondView.addSubview(label)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: SCREEN_WIDTH - 20, height: 100)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collection: UICollectionView = UICollectionView(frame: CGRect(x: 0, y: secondView.maxY, width: SCREEN_WIDTH, height: self.view.height - secondView.maxY), collectionViewLayout: layout)
        self.view.addSubview(collection)
        self.collectionView = collection
        self.collectionView?.regist(ShopCollectionViewCell.self)
        self.collectionView?.delegate = self as? UICollectionViewDelegate
        self.collectionView?.dataSource = self as? UICollectionViewDataSource
        
    }
    
    
    
}

extension ShopCollectionViewCell: UICollectionViewDelegate , UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ShopCollectionViewCell = collectionView.getRecycleCell(indexPath, ShopCollectionViewCell.self)
        
        return cell
        
    }
}
