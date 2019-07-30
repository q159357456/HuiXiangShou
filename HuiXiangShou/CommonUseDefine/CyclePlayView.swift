//
//  CyclePlayView.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/7/29.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import Kingfisher
//滚动方向
enum CycleViewRollingDirection: Int {
    
    case top
    
    case lelt
    
    case bottom
    
    case right
}
enum CycleViewContent: Int {
    
    case imgModel
    
    case txtModel
}
class CyclePlayView: UIView {
    
    //模式 纯文字 或者图片
    open var cycleViewContent: CycleViewContent = .imgModel
  
    //图片数据源
    open var pictures: [String] = [] {
        willSet{
            if newValue.count>0 {
                if self.cycleViewContent == .imgModel {
                    self.addSubview(self.collectionView)
                    self.collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: self.scrollPosition, animated: false)
                    self.startTimer()
                }
            }
        }

    }
    
    //文字数据源
    open var labels: [String] = [] {
        
        willSet{
            if newValue.count>0{
                
                if self.cycleViewContent == .txtModel {
                    self.addSubview(self.collectionView)
                    self.collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: self.scrollPosition, animated: false)
                    self.startTimer()
                }
            }
        }
      
    }
    
    
    //数据源数量
    internal var count: Int?{
        
        switch  self.cycleViewContent{
        case .txtModel:
            return self.labels.count
            
        case .imgModel:
            
            return self.pictures.count
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
            switch newValue {
            case .lelt, .top:
                self.index = 0
                
            case .right, .bottom:
                self.index = self.count! - 1
            }
            
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
    
    //用于collectionView显示数据源
    var datas: [String]?{
        
        var firstIndex = 0
        
        var secondIndex = 0
        
        var thirdIndex = 0
        
        
        

        switch count {
        case 0:
            return []
            
        case 1:
            break
        default:
            firstIndex = (self.index - 1) < 0 ? self.count! - 1 : self.index - 1
            secondIndex = self.index
            thirdIndex = (self.index + 1) > self.count! - 1 ? 0 : self.index + 1
       
        }
        
        switch self.cycleViewContent {
        case .imgModel:
            
            return [pictures[firstIndex], pictures[secondIndex], pictures[thirdIndex]]
      
        case .txtModel:
            return [labels[firstIndex], labels[secondIndex], labels[thirdIndex]]
        }
        
      
        
    }
    
    //当前元素的索引
    var index: Int = 0
    
    
    //滚动位置 (应该始终在中间显示中间一张视图)
    internal lazy var contentOffset: CGFloat = {
   
        switch self.direction {
        case .top,.bottom:
            return self.collectionView.contentOffset.y
        case .lelt,.right:
            return  self.collectionView.contentOffset.x
        }
        
    }()
    
    //collectionView滚动方向
    lazy var scrollPosition: UICollectionView.ScrollPosition = {
        
        switch self.direction {
            
        case .top:
            return UICollectionView.ScrollPosition.top
        case .bottom:
            return UICollectionView.ScrollPosition.bottom
        case .lelt:
            return UICollectionView.ScrollPosition.left
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
        case .top, .bottom:
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if self.cycleViewContent == .imgModel{
            
             collectionView.register(CycleDefautPicCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(CycleDefautPicCell.classForCoder()))
            
        }else
        {
             collectionView.register(CycleLabelCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(CycleLabelCell.classForCoder()))
        }
       
        
        return collectionView
    }()
    
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(frame: CGRect, direction: CycleViewRollingDirection) {
        self.init(frame: frame)
        self.direction = direction
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
    

}
//MARK: - timer
extension CyclePlayView{
    //开启定时器
    internal func startTimer()  {
        self.stopTimer()
        if self.autoScrollDelay >= 0.5 {
            self.timer = Timer.scheduledTimer(timeInterval: self.autoScrollDelay, target: self, selector: #selector(timerHandle), userInfo: nil, repeats: true)
            
            RunLoop.main.add(self.timer!, forMode: .common)
        }
    }
    
    //销毁定时器
    internal func stopTimer()  {
        if timer?.isValid == true {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @objc internal func timerHandle()  {
        
        var item: Int = 0
        
        switch self.direction {
        case .lelt, .bottom:
            item = 2
            
        case .top, .right:
            item = 0
        }
        
//      print(datas)
        self.collectionView.scrollToItem(at: IndexPath(item: item, section: 0), at: self.scrollPosition, animated: true)
    }
    
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CyclePlayView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch self.cycleViewContent {
        case .imgModel:
            let cell = collectionView .dequeueReusableCell(withReuseIdentifier: NSStringFromClass(CycleDefautPicCell.classForCoder()), for: indexPath) as! CycleDefautPicCell
            if let imageContentMode = self.imageContenMode {
                
                cell.imagev.contentMode = imageContentMode
            }
            if self.datas![indexPath.item].hasPrefix("http") {
                
                cell.imagev.kf.setImage(with: URL(string: self.datas![indexPath.item]), placeholder: self.placeholderImage)
                
            } else {
                
                cell.imagev.image = UIImage(named: self.datas![indexPath.item])
            }
            return cell
            
        case .txtModel:
            let cell = collectionView .dequeueReusableCell(withReuseIdentifier: NSStringFromClass(CycleLabelCell.classForCoder()), for: indexPath) as! CycleLabelCell
            
            cell.label?.text = self.datas?[indexPath.item]
            
            return cell
            
     
            
        }
 
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.didClickAtIndex?(self.index)
    }
}


//MARK: - UIScrollViewDelegate
extension CyclePlayView: UIScrollViewDelegate{
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.stopTimer()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.startTimer()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
        var offset: CGFloat = 0

        switch self.direction {
        case .lelt, .right:
            offset = scrollView.contentOffset.x

        case .top, .bottom:
            offset = scrollView.contentOffset.y
        }

        if offset >= self.contentOffset * 2 {

            if self.index == self.count! - 1 {

                self.index = 0

            } else {

                self.index += 1
            }

            self.collectionView.reloadData()

            self.collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: self.scrollPosition, animated: false)
        }

        if offset <= 0 {

            if self.index == 0 {

                self.index = self.count! - 1

            } else {

                self.index -= 1
            }

            self.collectionView.reloadData()

            self.collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: self.scrollPosition, animated: false)
        }
        
        
    }
}


class CycleDefautPicCell: UICollectionViewCell {
    
    lazy var imagev: UIImageView = {
        let imagev = UIImageView()
        return imagev
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imagev)
        imagev.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CycleLabelCell: UICollectionViewCell {
    
    let label: UILabel?
    
    override init(frame: CGRect) {
        label = UILabel()
        super.init(frame: frame)
        self.contentView.addSubview(label!)
        label?.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
