//
//  UICollectionViewExtention.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/7.
//  Copyright © 2019 工博科技. All rights reserved.
//

import Foundation
extension UICollectionView{
    
    func regist<T: UICollectionViewCell>(_ type: T.Type) {
        self.register(type.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(type.classForCoder()))
    }
    
    func getRecycleCell<T: UICollectionViewCell>(_ indexPath: IndexPath, _ type: T.Type) -> T {
      
        return self.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(type.classForCoder()), for: indexPath) as! T
        
    }
}

extension UITableView{
    
    func regist<T: UITableViewCell>(_ type: T.Type) {
        self.register(type.classForCoder(), forCellReuseIdentifier: NSStringFromClass(type.classForCoder()))
    }
    
    func getRecycleCell<T: UITableViewCell>( _ type: T.Type) -> T {
        
        return self.dequeueReusableCell(withIdentifier: NSStringFromClass(type.classForCoder())) as! T
        
    }
    
}
