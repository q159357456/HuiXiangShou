//
//  MineViewController.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/7/27.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import RxSwift
class MineViewController: BaseViewController {
    fileprivate lazy var bag = DisposeBag()
    var topView: TopView?
    var memberInfo: MemberModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        netWork()
//        self.view.backgroundColor = UIColor.red
//        let button: UIButton = UIButton.init(type: .custom)
//        button.backgroundColor = UIColor.yellow
//        button.setTitle("退出登录", for: .normal)
//        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
//        button.center = self.view.center
//        self.view.addSubview(button)
//        button.rx.tap.subscribe { (element) in
//            kUserDefaults.removeObject(forKey: TokenKey)
//            kNotificationPost(name: LoginChanel)
//            }.disposed(by: bag)
      
       
        // Do any additional setup after loading the view.
    }

}

extension MineViewController{
    func setUI() {
        
        let scroview: UIScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - kNavigationBarHeight - kTabBarHeight))
        scroview.showsVerticalScrollIndicator = false
        self.view.addSubview(scroview)
        
        let top: TopView = TopView(frame: CGRect(x: 10, y: 30, width: SCREEN_WIDTH - 20, height: 180))
        top.backgroundColor = randomColor()
        scroview.addSubview(top)
        self.topView = top
        
        let imageV: UIImageView = UIImageView(frame: CGRect(x: 10, y: top.maxY + 10, width: SCREEN_WIDTH - 20, height: 60))
        imageV.backgroundColor = randomColor()
        scroview.addSubview(imageV)
        
        let view: UIView = UIView(frame: CGRect(x: 10, y: imageV.maxY + 10, width: SCREEN_WIDTH - 20, height: SCREEN_WIDTH - 60))
        view.backgroundColor = randomColor()
        scroview.addSubview(view)
        
        let w: CGFloat = view.width/3
        let h: CGFloat = view.height/3
        
        for inx in 0..<8{
            let x: CGFloat = CGFloat(inx%3) * w
            let y: CGFloat = CGFloat(inx/3) * h
            
            let butn: LIButton = LIButton(frame: CGRect(x: x, y: y, width: w, height: h))
            butn.btnType = .topBottom
            butn.setImage(Hxs_PlaceHloder, for: .normal)
            butn.setTitle("66666", for: .normal)
            butn.titleLabel?.font = hxs_lightFont
            view.addSubview(butn)
            
        }
        
        scroview.contentSize = CGSize(width: SCREEN_WIDTH, height: view.maxY)
    }
    
    func loadMemberInfo() {
        self.topView?.imageV.kf.setImage(with: URL(string: self.memberInfo?.popimgurl ?? ""), placeholder: Hxs_PlaceHloder)
        self.topView?.label1.text = self.memberInfo?.MS002
        self.topView?.label2.text = "ID:\(self.memberInfo?.MS001 ?? "")"
    }
}

class TopView: UIView {
    let imageV: UIImageView = UIImageView()
    let label1: UILabel = UILabel()
    let label2: UILabel = UILabel()
    let label3: UILabel = UILabel()
    let label4: UILabel = UILabel()
    let button1: UIButton = UIButton(type: .custom)
    let button2: UIButton = UIButton(type: .custom)

    var datalabel1: UILabel?
    var datalabel2: UILabel?
    var datalabel3: UILabel?
    var datalabel4: UILabel?
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         self.backgroundColor = .white
        self.addSubview(imageV)
        self.addSubview(label1)
        self.addSubview(label2)
        self.addSubview(label3)
        self.addSubview(label4)
        self.addSubview(button1)
        self.addSubview(button2)
        
        label1.font = hxs_lightFont
        label2.font = hxs_lightFont
        label3.font = hxs_lightFont
        label4.font = hxs_lightFont
        
//        
//        imageV.backgroundColor = randomColor()
//        label1.backgroundColor = randomColor()
//        label2.backgroundColor = randomColor()
        label3.backgroundColor = randomColor()
        label4.backgroundColor = randomColor()
        button1.backgroundColor = randomColor()
        button2.backgroundColor = randomColor()
      
        
        imageV.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        label1.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(imageV.snp_right).offset(10)
            make.height.equalTo(15)
            make.right.equalTo(self)
        }
        label2.snp.makeConstraints { (make) in
            make.top.equalTo(label1.snp_bottom).offset(5)
            make.left.equalTo(imageV.snp_right).offset(10)
            make.height.equalTo(W_Scale(x: 15))
            make.right.equalTo(self)
        }
        button1.snp.makeConstraints { (make) in
            make.top.equalTo(label2.snp_bottom).offset(5)
            make.left.equalTo(imageV.snp_right).offset(10)
            make.height.equalTo(15)
            make.width.equalTo(100)
        }
        label3.snp.makeConstraints { (make) in
            make.centerY.equalTo(button1.snp_centerY)
            make.left.equalTo(button1.snp_right).offset(2)
            make.height.equalTo(15)
            make.width.equalTo(80)
        }
        label4.snp.makeConstraints { (make) in
            make.top.equalTo(button1.snp_bottom).offset(5)
            make.left.equalTo(imageV.snp_right).offset(10)
            make.height.equalTo(15)
            make.width.equalTo(100)
        }
      
        button2.snp.makeConstraints { (make) in
            make.centerY.equalTo(label4.snp_centerY)
            make.left.equalTo(label4.snp_right).offset(2)
            make.height.equalTo(15)
            make.width.equalTo(50)
        }
       
        
        let line: UIView = UIView(frame: CGRect(x: 0, y: self.height/2, width: self.width, height: 1))
        line.backgroundColor = .lightGray
        self.addSubview(line)
        
        let temp: CGFloat = self.height*3/4
        for inx in 0..<4{
            let la1: UILabel = UILabel()
            let la2: UILabel = UILabel()
            self.addSubview(la1)
            self.addSubview(la2)
            la1.snp.makeConstraints { (make) in
              make.top.equalTo(temp - 20)
              make.size.equalTo(CGSize(width: self.width/4, height: 15))
              make.left.equalTo(self.width * CGFloat(inx)/4)
            }
            la2.snp.makeConstraints { (make) in
                make.top.equalTo(temp + 5)
                make.size.equalTo(CGSize(width: self.width/4, height: 15))
                make.left.equalTo(self.width * CGFloat(inx)/4)
            }
            la1.backgroundColor = randomColor()
            la2.backgroundColor = randomColor()
            la1.font = hxs_lightFont
            la2.font = hxs_lightFont
            la1.textColor = .red
            
            switch inx {
                case 0:
                    self.datalabel1 = la1
                 break
                case 1:
                    self.datalabel2 = la1
                break
                case 2:
                    self.datalabel3 = la1
                break
                case 3:
                    self.datalabel4 = la1
                break
            default:
                break
                
            }
        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MineViewController{
    
    func netWork() {
        _ = getMemberInfo().done({ (data) in
            self.memberInfo = data
            self.loadMemberInfo()
        })
    }
}
