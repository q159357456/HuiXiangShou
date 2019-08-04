//
//  HomeViewController.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/27.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import PromiseKit
import RxCocoa
class HomeViewController: BaseViewController {
    fileprivate lazy var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
     
        // Do any additional setup after loading the view.
    }
}
 // MARK: - UI
extension HomeViewController{
    
    func setUI() {
        let scroView: UIScrollView = UIScrollView(frame: self.view.bounds)
        scroView.showsVerticalScrollIndicator = false
        self.view.addSubview(scroView)
        
        let oneView: UIView = UIView()
        let secondView: UIView = UIView()
        let thirdView: UIView = UIView()
        let forthView: UIView = UIView()
        let fiveView: UIView = UIView()
        let sixView: UIView = UIView()
        scroView.addSubview(oneView)
        scroView.addSubview(secondView)
        scroView.addSubview(thirdView)
        scroView.addSubview(forthView)
        scroView.addSubview(fiveView)
        scroView.addSubview(sixView)
        
        oneView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH/2)
        secondView.frame = CGRect(x: 0, y: oneView.maxY, width: SCREEN_WIDTH, height: SCREEN_WIDTH/2)
        thirdView.frame = CGRect(x: 0, y: secondView.maxY, width: SCREEN_WIDTH, height: W_Scale(x: 80))
        forthView.frame = CGRect(x: 0, y: thirdView.maxY, width: SCREEN_WIDTH, height: SCREEN_WIDTH/2)
        fiveView.frame = CGRect(x: 0, y:forthView.maxY, width: SCREEN_WIDTH, height: SCREEN_WIDTH*2/3)
        sixView.frame = CGRect(x: 0, y: fiveView.maxY, width: SCREEN_WIDTH, height: W_Scale(x: 170+18*2)+20+80)
        oneView.backgroundColor = randomColor()
        secondView.backgroundColor = randomColor()
        thirdView.backgroundColor = randomColor()
        forthView.backgroundColor = randomColor()
        fiveView.backgroundColor = randomColor()
        sixView.backgroundColor = randomColor()
        scroView.contentSize = CGSize(width: SCREEN_WIDTH, height: sixView.maxY)
        
        let cycleImgV: CyclePlayView = CyclePlayView(frame: oneView.bounds, direction: .lelt)
        cycleImgV.cycleViewContent = .imgModel
        cycleImgV.pictures = ["placeHolder","placeHolder","placeHolder","placeHolder"];
        cycleImgV.didClickAtIndex = { index in
            print(index)
        }
        oneView.addSubview(cycleImgV)
        
        
        
        let v3_imagev: UIImageView = UIImageView(frame: CGRect(x: 15, y: W_Scale(x: 10), width: W_Scale(x: 60), height: W_Scale(x: 60)))
        let line: UIView = UIView(frame: CGRect(x: v3_imagev.maxX+10, y: W_Scale(x: 20), width: 1, height: W_Scale(x: 40)))
        line.backgroundColor = .lightGray
        v3_imagev.backgroundColor = .red
        let labes: [String] = ["222222", "333333", "444444","55555"]

        let cycleLabelsV: CyclePlayView = CyclePlayView(frame:  CGRect(x: line.maxX+10, y: W_Scale(x: 10), width: thirdView.width - line.maxX - 20, height: W_Scale(x: 60)), direction: .bottom)
        cycleLabelsV.cycleViewContent = .txtModel
        cycleLabelsV.labels = labes
        
        
        thirdView.addSubview(v3_imagev)
        thirdView.addSubview(line)
        thirdView.addSubview(cycleLabelsV)
        
        
        let imagearr: [String] = ["placeHolder","placeHolder","placeHolder","placeHolder","placeHolder","placeHolder","placeHolder","placeHolder","placeHolder","placeHolder"];
        let titleearr: [String] = ["6666","666","6666","6666","666","666","666","666","6666","666"];
        
        for inx in 0..<imagearr.count {
            let w:CGFloat = secondView.width/5
            let h: CGFloat = secondView.height/2
            let x:CGFloat = w * CGFloat(inx%5)
            let y:CGFloat  = CGFloat(inx/5)*h
            
            let button = LIButton.init(type: .custom)
            button.frame = CGRect(x: x, y: y, width: w, height: h)
            secondView.addSubview(button)
            button.setTitle(titleearr[inx], for: .normal)
            button .setImage(kGetImage(name: imagearr[inx]), for: .normal)
            button.addTarget(self, action: #selector(secondClick(btn:)), for: .touchUpInside)
         
        }
        
        let imagearr1: [String] = ["placeHolder","placeHolder","placeHolder","placeHolder"]
        let titlearr1: [String] = ["6666","666","6666","6666"]
        for inx in 0..<imagearr1.count {
            let w:CGFloat = forthView.width/CGFloat(imagearr1.count)
            let x:CGFloat = w * CGFloat(inx)
            let button = LIButton.init(type: .custom)
            button.frame = CGRect(x: x, y: 0, width: w, height: W_Scale(x: 120))
            button.setTitle(titlearr1[inx], for: .normal)
            button .setImage(kGetImage(name: imagearr1[inx]), for: .normal)
            button.labelImgOffset = W_Scale(x: 30)
            
            let label: UILabel = UILabel()
            label.frame = CGRect(x: x, y: button.maxY, width: w, height: 15)
            label.backgroundColor = .yellow
            
            forthView.addSubview(button)
            forthView.addSubview(label)
            
        }
        
        
        for inx in 0..<4 {
            let space: CGFloat = 10
            let w:CGFloat = (fiveView.width - 3 * space)/2
            let h: CGFloat = w/2
            let x:CGFloat = (w + space) * CGFloat(inx%2)  + space
            let y:CGFloat  = CGFloat(inx/2)*(h + space) + space
            let hot: HotComboView = HotComboView(frame: CGRect(x: x, y: y, width: w, height: h))
            fiveView.addSubview(hot)
            hot.backgroundColor = .red
            
        }
        
        
        
        
        let v6_labe1: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH/2, height: 40))
        
        let v6_labe2: UILabel = UILabel(frame: CGRect(x: v6_labe1.maxX, y: 0, width: SCREEN_WIDTH/2, height: 40))
        
        let title: ThemeTitleView = ThemeTitleView(frame: CGRect(x: 0, y: v6_labe2.maxY, width: SCREEN_WIDTH, height: 40))
        
        let h: CGFloat = ProListTableViewCell.rowForHeight()
        
        let prolistView: ProListTableViewCell = ProListTableViewCell(frame: CGRect(x: 0, y: title.maxY, width: SCREEN_WIDTH, height: h))
        
        
        sixView.addSubview(v6_labe1)
        sixView.addSubview(v6_labe2)
        sixView.addSubview(title)
        sixView.addSubview(prolistView)
        
        title.label?.text = "超值抢购/限时秒杀"
        title.backgroundColor = .yellow
       
        
        v6_labe1.text = "正品保证"
        v6_labe2.text = "假一赔十"
        
        v6_labe1.textAlignment = .center
        v6_labe2.textAlignment = .center
        
        v6_labe1.textColor = .white
        v6_labe2.textColor = .white
        
        v6_labe1.backgroundColor = MainColor
        v6_labe2.backgroundColor = MainColor
        
        
    }
    
}

 // MARK: - action
extension HomeViewController{
    
    @objc func secondClick(btn: UIButton) {
        
    }
}
