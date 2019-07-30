//
//  CyclePlayView.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/7/29.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

//滚动方向
enum CycleViewRollingDirection: Int {
    
    case top
    
    case lelt
    
    case bootom
    
    case right
}
enum CycleViewContent: Int {
    
    case imgModel
    
    case txtModel
}
class CyclePlayView: UIView {
  
    //数据源
    open var pictures: [String] = [] {
        
        didSet{
            
        }
    }
    
    //占位图
    open var placeholderImage: UIImage?
    
    open var titles: [String] = []{
        
        didSet{
            
        }
    }
    
    //滚动方向
    open var direction: CycleViewRollingDirection = .lelt{
        
        willSet{
            
            
        }
        
    }
    
    //滚动间隔时间
    open var autoScrollDelay: TimeInterval = 2
    
    //设置图片的contenMode
    open var imageContenMode: UIView.ContentMode?
    
    //点击回调 从 0 开始
    open var didClickAtIndex: ((_: Int) ->Void)?
    
    //定时器
    internal var timer: Timer?
    
    //collectionView滚动方向
    internal lazy var scrollPosition : UICollectionView.ScrollPosition = {
        switch self.direction{
        case .top:
            return UICollectionView.ScrollPosition.top
        case .lelt:
            return UICollectionView.ScrollPosition.left
        case .bootom:
            return UICollectionView.ScrollPosition.bottom
        case .right:
            return UICollectionView.ScrollPosition.right
        }
         
    }()
    
    //collectionView
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = self.frame.size
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        switch self.direction{
        case .top, .bootom:
             layout.scrollDirection = .vertical
        case .lelt, .right:
             layout.scrollDirection = .horizontal
        }
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.width, height: self.height), collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.backgroundColor = .white
        
        collectionView.isPagingEnabled = true
        
        collectionView.bounces = false
        
        collectionView.register(CycleDefautPicCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(CycleDefautPicCell.classForCoder()))
        
        return collectionView
    }()
    

}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CyclePlayView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: NSStringFromClass(CycleDefautPicCell.classForCoder()), for: indexPath) as! CycleDefautPicCell
        
        return cell
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.didClickAtIndex?(indexPath.item)
    }
}


class CycleDefautPicCell: UICollectionViewCell {
    
    lazy var imagev: UIImageView = {
        let imagev = UIImageView()
        return imagev
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(imagev)
        imagev.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
