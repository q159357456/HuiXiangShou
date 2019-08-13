//
//  ProListTableViewCell.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/7/29.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import SnapKit
class ProListTableViewCell: UITableViewCell {
    var dataList: [ProductModel]? {
        didSet{
            self.colectionView.reloadData()
        }
    }
    let colectionView: UICollectionView
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        colectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(colectionView)
        colectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        colectionView.register(ProCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(ProCollectionViewCell.classForCoder()))
        colectionView.showsHorizontalScrollIndicator = false
        colectionView.delegate = self
        colectionView.dataSource = self
        colectionView.backgroundColor = .white
        layout.scrollDirection = .horizontal

    }

    convenience init(frame: CGRect) {
        self.init(style: .default, reuseIdentifier: nil)
        self.frame = frame
        
    }
    
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func rowForHeight() -> CGFloat{
        
         return W_Scale(170+18*2) + 10
    }

}
// MARK: - reload
extension ProListTableViewCell{
    
   
}

extension ProListTableViewCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataList?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ProCollectionViewCell.classForCoder()), for: indexPath) as! ProCollectionViewCell
        let model: ProductModel = self.dataList![indexPath.item]
        cell.proModel = model
        return cell
        
    }
    
}

extension ProListTableViewCell: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model: ProductModel = self.dataList![indexPath.item]
        let vc: ProDetailController = ProDetailController()
        vc.shopid = model.shopid ?? ""
        vc.productid = model.ProductNo ?? ""
        kAppDelegate.navigationController?.pushViewController(vc, animated: true)
    }
}


extension ProListTableViewCell: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: W_Scale(170), height:  W_Scale(170+18*2))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
         return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

