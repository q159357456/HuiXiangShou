//
//  StringExtention.swift
//  HuiXiangShou
//
//  Created by 秦根 on 2019/8/1.
//  Copyright © 2019 工博科技. All rights reserved.
//

import Foundation
import CommonCrypto
extension String{
    func toData() -> Data {
        return self.data(using: String.Encoding.utf8)!
    }
    
    
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    //将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
    
    func toHtml() -> String {
//        let styleStr: String = String(format: "<head><style>img{max-width:%ldpx !important;}ul {margin:0; padding:0; text-align:left;}</style><head>", SCREEN_WIDTH  * 0.95)
//        let styleStr: String = String(format: "<head><style>body, div, span, a, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, p, th, td, pre, form, fieldset, legend, input, button, textarea, select {margin:0;padding:5;}img{max-width:%ldpx !important;}li {list-style:none;}</style><head>", SCREEN_WIDTH  * 0.95)
        var str: String = self
        let scaner: Scanner = Scanner.init(string: self)
        let dict = ["&amp;":"&", "&lt;":"<", "&gt;":">", "&nbsp;":"", "&quot;":"\"", "width":"wid"]
        while scaner.isAtEnd == false {
            for (key, value) in dict {
                scaner.scanUpTo(key, into: nil)
                str = str.replacingOccurrences(of: key, with: value)
                
            }
        }
        
        return str
    }
    
}
