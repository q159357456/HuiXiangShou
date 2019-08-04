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
    
}
