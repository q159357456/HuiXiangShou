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
import Kingfisher
class HomeViewController: BaseViewController {
    fileprivate lazy var bag = DisposeBag()
    var picArray:[CyclePicModel]?
    var noticeArray:[NoticeModel]?
    var classifyArray: [ClassifyModel]?
    var goodsArray: [GoodsListModel]?
    var proArray: [ProductModel]?
    var plamountArray: [PlatformAmountModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        netWorking()
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

        scroView.contentSize = CGSize(width: SCREEN_WIDTH, height: sixView.maxY)
        
        let cycleImgV: CyclePlayView = CyclePlayView(frame: oneView.bounds, direction: .lelt)
        cycleImgV.cycleViewContent = .imgModel
        var piclist = [String]()
        if self.picArray != nil{
            for picm in self.picArray!{
                guard picm.PicAddress1 != nil else{
                    break
                }
                piclist.append(picm.PicAddress1!)
            }
            
        }else
        {
            piclist = ["placeHolder","placeHolder","placeHolder","placeHolder"]
        }
       
     
        cycleImgV.pictures = piclist
        cycleImgV.didClickAtIndex = { index in
            print(index)
        }
        oneView.addSubview(cycleImgV)
        
        
        
        let v3_imagev: UIImageView = UIImageView(frame: CGRect(x: 15, y: W_Scale(x: 10), width: W_Scale(x: 60), height: W_Scale(x: 60)))
        let line: UIView = UIView(frame: CGRect(x: v3_imagev.maxX+10, y: W_Scale(x: 20), width: 1, height: W_Scale(x: 40)))
        line.backgroundColor = .lightGray
        v3_imagev.backgroundColor = .red
        var nolsit = [String]()
        if self.noticeArray != nil {
            for nom in self.noticeArray!{
                nolsit.append(nom.Msg ?? "")
            }
        }else
        {
            nolsit = ["暂无公告"];
        }
        

        let cycleLabelsV: CyclePlayView = CyclePlayView(frame:  CGRect(x: line.maxX+10, y: W_Scale(x: 10), width: thirdView.width - line.maxX - 20, height: W_Scale(x: 60)), direction: .bottom)
        cycleLabelsV.cycleViewContent = .txtModel
        cycleLabelsV.scroEable = false
        cycleLabelsV.labels = nolsit
        thirdView.addSubview(v3_imagev)
        thirdView.addSubview(line)
        thirdView.addSubview(cycleLabelsV)
        
        var classImagelist = [String]()
        var titlelist = [String]()
        if self.classifyArray != nil{
            for cla in self.classifyArray!{
                let pic: String = cla.pictureurl != nil ? cla.pictureurl!: "placeHolder"
                let title: String = cla.ClassifyName != nil ? cla.ClassifyName! : ""
                classImagelist.append(pic)
                titlelist.append(title)
            }
        }else
        {
            classImagelist = ["placeHolder","placeHolder","placeHolder","placeHolder","placeHolder","placeHolder","placeHolder","placeHolder","placeHolder","placeHolder"];
            titlelist = ["","","","","","","","","",""];
            
        }
        for inx in 0..<classImagelist.count {
            let w:CGFloat = secondView.width/5
            let h: CGFloat = secondView.height/2
            let x:CGFloat = w * CGFloat(inx%5)
            let y:CGFloat  = CGFloat(inx/5)*h
            
            let button = LIButton.init(type: .custom)
            button.frame = CGRect(x: x, y: y, width: w, height: h)
            secondView.addSubview(button)
            button.setTitle(titlelist[inx], for: .normal)
            if classImagelist[inx] .hasPrefix("http"){
                button.kf.setImage(with: URL(string: classImagelist[inx].urlEncoded()), for: .normal)
            }else
            {
                 button .setImage(kGetImage(name: classImagelist[inx]), for: .normal)
            }
            button.titleLabel?.font = kSystemFont(font: 13)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(secondClick(btn:)), for: .touchUpInside)
         
        }
        
        let imagearr1: [String] = ["placeHolder","placeHolder","placeHolder","placeHolder"]
        let titlearr1: [String] = ["新进池","待分配","已发池","公益金"]
        let plmodel: PlatformAmountModel? = self.plamountArray?.first
        
        let contlist: [Float] = [plmodel?.Cash1 ?? 0.0, plmodel?.cash2 ?? 0.0, plmodel?.cash3 ?? 0.0, plmodel?.cash4 ?? 0.0]
        
        for inx in 0..<imagearr1.count {
            let w:CGFloat = forthView.width/CGFloat(imagearr1.count)
            let x:CGFloat = w * CGFloat(inx)
            let button = LIButton.init(type: .custom)
            button.frame = CGRect(x: x, y: 0, width: w, height: W_Scale(x: 120))
            button.setTitle(titlearr1[inx], for: .normal)
            button .setImage(kGetImage(name: imagearr1[inx]), for: .normal)
            button.labelImgOffset = W_Scale(x: 30)
            button.titleLabel?.font = kSystemFont(font: W_Scale(x: 13))
            let label: UILabel = UILabel()
            label.frame = CGRect(x: x, y: button.maxY, width: w, height: 15)
            label.textAlignment = .center
            label.font = kSystemFont(font: W_Scale(x: 13))
            label.text = "￥\(contlist[inx])"
            forthView.addSubview(button)
            forthView.addSubview(label)
            
        }
        
        
        if self.goodsArray != nil {
            let count: Int = self.goodsArray!.count
            for inx in 0..<count {
                let space: CGFloat = 10
                let w:CGFloat = (fiveView.width - 3 * space)/2
                let h: CGFloat = w/2
                let x:CGFloat = (w + space) * CGFloat(inx%2)  + space
                let y:CGFloat  = CGFloat(inx/2)*(h + space) + space
                let hot: HotComboView = HotComboView(frame: CGRect(x: x, y: y, width: w, height: h))
                let goodmodel: GoodsListModel = self.goodsArray![inx]
                hot.label1.text = goodmodel.ProductName
                hot.label2.text = "\(goodmodel.RetailPrice ?? "0.00")元"
                
                fiveView.addSubview(hot)
                hot.backgroundColor = .red
            }
        }
       
        
        
        
        
        let v6_labe1: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH/2, height: 40))
        
        let v6_labe2: UILabel = UILabel(frame: CGRect(x: v6_labe1.maxX, y: 0, width: SCREEN_WIDTH/2, height: 40))
        
        let title: ThemeTitleView = ThemeTitleView(frame: CGRect(x: 0, y: v6_labe2.maxY, width: SCREEN_WIDTH, height: 40))
        
        let h: CGFloat = ProListTableViewCell.rowForHeight()
        
        let prolistView: ProListTableViewCell = ProListTableViewCell(frame: CGRect(x: 0, y: title.maxY, width: SCREEN_WIDTH, height: h))
        if self.proArray != nil{
            prolistView.dataList = self.proArray
        }
        
        sixView.addSubview(v6_labe1)
        sixView.addSubview(v6_labe2)
        sixView.addSubview(title)
        sixView.addSubview(prolistView)
        
        title.label?.text = "超值抢购/限时秒杀"
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

 // MARK: - network
extension HomeViewController{
    func netWorking() {
        let provider1 = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: self.view) ,RequestCodeHnadlePlugin()])
        let provider2 = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: self.view), RequestCodeHnadlePlugin()])
        let provider3 = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: self.view),RequestCodeHnadlePlugin()])
        let provider4 = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: self.view), RequestCodeHnadlePlugin()])
        let provider5 = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: self.view), RequestCodeHnadlePlugin()])
        let provider6 = MoyaProvider<ApiManager>(plugins: [RequestHitPlugin(view: self.view), RequestCodeHnadlePlugin()])
        
        let base2: RequestBaseModel = RequestBaseModel()
        base2.basedata.para1 = "000001"
        base2.basedata.pageindex = 1
        base2.basedata.pagesize = 5
        base2.sign = Hfx_Sign(params: base2.basedata.toOrderJson(), time: base2.timestamp)
        
        let base3: RequestBaseModel = RequestBaseModel()
        base3.sign = Hfx_Sign(params: nil, time: base3.timestamp)
     
        
        
        let base4: RequestBaseModel = RequestBaseModel()
        base4.basedata.para1 = ""
        base4.basedata.para2 = "1106"
        base4.basedata.pageindex = 1
        base4.basedata.pagesize = 5
        base4.sign = Hfx_Sign(params: base4.basedata.toOrderJson(), time: base4.timestamp)
        
        let base5: RequestBaseModel = RequestBaseModel()
        base5.basedata.pageindex = 1
        base5.basedata.pagesize = 5
        base5.dataList.classifyno = "11"
        let signp: String = base5.basedata.toOrderJson()! + "&" + base5.dataList.toOrderJson()!
        base5.sign = Hfx_Sign(params:signp, time: base5.timestamp)
        
        let base6: RequestBaseModel = RequestBaseModel()
        base6.timestamp =  StringTimeStampPluse
        base6.sign = Hfx_Sign(params: nil, time: base6.timestamp)
        
        let pro1 = requestObjListAPI(provider1, CyclePicModel.self, .LoginStartAD(key: "78"))
        let pro2 = requestObjListAPI(provider2, NoticeModel.self, .SysGetNoticeInfo(request: base2.toJSONString()!))
        let pro3 = requestObjListAPI(provider3, ClassifyModel.self, .ShopShopClassifyList(request: base3.toJSONString()!))
        let pro4 = requestObjListAPI(provider4, GoodsListModel.self, .ProductGoodsList(request: base4.toJSONString()!))
        let pro5 = requestObjListAPI(provider5, ProductModel.self, .ProductGoodsListByCondition(request: base5.toJSONString()!))
        let pro6 = requestObjListAPI(provider6, PlatformAmountModel.self, .SysPlatformAmount(request: base6.toJSONString()!))
        
        _ = when(fulfilled: pro1,pro2,pro3,pro4,pro5).then{ data1,data2,data3,data4,data5 -> Promise<[PlatformAmountModel]> in
            self.picArray = data1
            self.noticeArray = data2
            self.classifyArray = data3
            self.goodsArray = data4
            self.proArray = data5
            return pro6
            }.done({ (data6) in
                self.plamountArray = data6
                self.setUI()
            })
    }
}

 // MARK: - action
extension HomeViewController{
    
    @objc func secondClick(btn: UIButton) {
        
    }
}
