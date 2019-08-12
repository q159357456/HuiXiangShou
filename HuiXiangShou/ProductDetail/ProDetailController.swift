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
        preferences.minimumFontSize = 60;
        configuration.preferences = preferences
        let webview: WKWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - kNavigationBarHeight), configuration: configuration)
       
        return webview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.webView)
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
            self.webView.loadHTMLString(model!.GoodsDetail ?? "", baseURL: nil)
     
        })
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
