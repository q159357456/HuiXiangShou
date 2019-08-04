//
//  StoreViewController.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/27.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit

class StoreViewController: BaseViewController {
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.register(ProListTableViewCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(ProListTableViewCell.classForCoder()))
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
        let titlelist: [String] = ["68","68888","600000"]
        let view: UIView = UIView(frame: CGRect(x: 0, y: self.cycleView.maxY, width: SCREEN_WIDTH, height: 60))
        for inx in 0..<imaglist.count {
            let w: CGFloat = SCREEN_WIDTH/CGFloat(imaglist.count)
            
            let btn: LIButton = LIButton(frame: CGRect(x: w*CGFloat(inx), y: 0, width: w, height: view.height))
            btn.setImage(kGetImage(name: imaglist[inx]), for: .normal)
            btn.setTitle(titlelist[inx], for: .normal)
            btn.imgSize = CGSize(width: 30, height: 30)
            btn.btnType = .leftRight
            view.addSubview(btn)
            
        }
        
        return view
        
    }()
    
    lazy var tableHeaderView: UIView = {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: self.topView.maxY))
        view.addSubview(self.cycleView)
        view.addSubview(self.topView)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableHeaderView = self.tableHeaderView
        tableView.delegate = self as? UITableViewDelegate
        tableView.dataSource = self as? UITableViewDataSource
        self.view.addSubview(self.tableView)
  
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


extension StoreViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ProListTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ProListTableViewCell.classForCoder()))! as! ProListTableViewCell
        return cell

    }


}

extension StoreViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProListTableViewCell.rowForHeight()
    }

}
