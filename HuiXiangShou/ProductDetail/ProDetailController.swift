//
//  ProDetailController.swift
//  HuiXiangShou
//
//  Created by chenheng on 2019/8/12.
//  Copyright © 2019 工博科技. All rights reserved.
//

import UIKit
import Moya
import PromiseKit
import WebKit
class ProDetailController: BaseViewController {
    
    var shopid: String = ""
    var  productid: String = ""
    lazy var webView: WKWebView = {
        let configuration: WKWebViewConfiguration =  WKWebViewConfiguration.init()
        let preferences: WKPreferences = WKPreferences.init()
//        preferences.minimumFontSize = 100;
        configuration.preferences = preferences
        let webview: WKWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - kNavigationBarHeight), configuration: configuration)
        return webview
    }()
    
    let topheight: CGFloat = ProductDetailTopView.selfHeight()
    
    
    lazy var productTopView: ProductDetailTopView = {
       
        let top: ProductDetailTopView  = ProductDetailTopView(frame: CGRect(x: 0, y: -topheight , width: SCREEN_WIDTH, height: topheight))
        return top
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
     
        
        let provider = MoyaProvider<ApiManager>(plugins:[RequestHitPlugin(view: self.view), RequestPrintResultPlugin()])
        let base: RequestBaseModel = RequestBaseModel()
        base.basedata.para1 = shopid
        base.basedata.para2 = "03"
        base.basedata.para3 = productid
        base.sign = Hfx_Sign(params: base.basedata.toOrderJson(), time: base.timestamp)
        _ = requestObjListAPI(provider, ProDetailModel.self, .ProductGoodsSpecList(request: base.toJSONString()!)).done({ (data) in
            let model: ProDetailModel? = data.first ?? nil
            guard model != nil else {
                return
            }
            self.webView.scrollView.contentInset = UIEdgeInsets(top: self.topheight, left: 0, bottom: 0, right: 0 )
            self.view.addSubview(self.webView)
            let html: String = model?.GoodsDetail?.toHtml() ?? ""
            self.webView.loadHTMLString(html, baseURL: nil)
            self.webView.scrollView.addSubview(self.productTopView)
            self.productTopView.promodel = model

        })
        // Do any additional setup after loading the view.
    }


}

class ProductDetailTopView: UIView {
    
    var promodel: ProDetailModel?{
        
        didSet{
            var piclist = [String]()
            if promodel?.listPic != nil {
                for picmodel in promodel!.listPic! {
                    piclist.append(picmodel.path ?? "")
                }
            }
            self.picCycleView.pictures = piclist
          
            self.label1.text = "\(promodel?.RetailPrice ?? 0)+\(promodel?.Bonus ?? 0)积分"
            self.label2.text = "\(promodel?.StanPrice ?? 0)"
            self.label3.text = promodel?.ProductName
            self.label4.text = "\(promodel?.SellQty ?? 0)"
            self.label5.text = promodel?.Brand
        }
    }
    
    
    let picCycleView: CyclePlayView = CyclePlayView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH/2), direction: .lelt)
    let label1: UILabel = UILabel()
    let label2: UILabel = UILabel()
    let label3: UILabel = UILabel()
    let label4: UILabel = UILabel()
    let label5: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        picCycleView.cycleViewContent = .imgModel
        picCycleView.pictures = ["placeHolder"]
        self.addSubview(picCycleView)
        let bgView: UIView = UIView(frame: CGRect(x: 0, y: picCycleView.maxY, width: SCREEN_WIDTH, height: W_Scale(120)))
        bgView.backgroundColor = .white
        self.addSubview(bgView)
        bgView.addSubview(label1)
        bgView.addSubview(label2)
        bgView.addSubview(label3)
        bgView.addSubview(label4)
        bgView.addSubview(label5)

        label3.numberOfLines = 0
        label3.font = kSystemFont(font: 14)
        label2.snp.makeConstraints { (make) in
            
            make.right.equalTo(bgView).offset(-10)
            make.size.equalTo(CGSize(width: 50, height: 25))
            make.top.equalTo(bgView).offset(10)
            
        }
        label1.snp.makeConstraints { (make) in
            make.left.equalTo(bgView).offset(10)
            make.height.equalTo(25)
            make.right.equalTo(label2.snp_left)
            make.top.equalTo(bgView).offset(10)
        }
        label3.snp.makeConstraints { (make) in
           make.top.equalTo(label1.snp_bottom).offset(2)
           make.size.equalTo(CGSize(width: SCREEN_WIDTH - 20, height: 38))
           make.centerX.equalTo(bgView)
        }
        label4.snp.makeConstraints { (make) in
            make.left.equalTo(bgView).offset(10)
            make.size.equalTo(CGSize(width: 70, height: 17))
            make.top.equalTo(label3.snp_bottom).offset(10)
        }
        label5.snp.makeConstraints { (make) in
            make.right.equalTo(bgView).offset(-10)
            make.size.equalTo(CGSize(width: 70, height: 17))
            make.top.equalTo(label3.snp_bottom).offset(10)
        }
        
        let lineView1: UIView = UIView(frame: CGRect(x: 0, y: bgView.maxY, width: SCREEN_WIDTH, height: 10))
        lineView1.backgroundColor = MainBgColor
        
        let clickView: UIView = UIView(frame: CGRect(x: 0, y: lineView1.maxY, width: SCREEN_WIDTH, height: 40))
        clickView.backgroundColor = .white
        
        let lineView2: UIView = UIView(frame: CGRect(x: 0, y: clickView.maxY, width: SCREEN_WIDTH, height: 10))
        lineView2.backgroundColor = MainBgColor
        
        self.addSubview(lineView1)
        self.addSubview(lineView2)
        self.addSubview(clickView)
        
        let guige: UILabel = UILabel(frame: CGRect(x: 10, y: 0, width: W_Scale(100), height: clickView.height))
        guige.text = "商品规格:"
        clickView.addSubview(guige)
        let tipimageV: UIImageView = UIImageView(frame: CGRect(x: SCREEN_WIDTH - 30, y: (clickView.height - 20)/2, width: 20, height: 20))
        tipimageV.backgroundColor = randomColor()
        clickView.addSubview(tipimageV)
        
        let conlael: UILabel = UILabel(frame: CGRect(x: guige.maxX + 2, y: 0, width: tipimageV.x - guige.maxX, height: clickView.height))
        conlael.backgroundColor = randomColor()
        clickView.addSubview(conlael)
        
        
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    class func selfHeight() -> CGFloat {
         return SCREEN_WIDTH/2 + W_Scale(120) + 40 + 20
    }
}

///////
class PopSpecvView: UIView {
    
    var datalist: [ListSpecModel]?
    
    
    
}
