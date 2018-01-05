//
//  BasicAuthConstants.swift
//  NDGApp
//
//  Copyright © 2017 Nestec S.A. All rights reserved.
//

import Foundation

protocol BasicAuthConstantsProtocol {
    static var username: String { get }
    static var password: String { get }
}

enum BasicAuthConstants: BasicAuthConstantsProtocol {
    
    static var username: String {
        return "baleeiro-hub" //Bundle.main.object(forInfoDictionaryKey: "WEBLOGIN_USER") as! String
    }
    
    static var password: String {
        
        //Adjust token
        var strToken = "b<!>ca49506<?>ad38<!>214<?>25b4<!>f881<?>41099<!>846<?>a80<!>83a66b<?>"
        strToken = strToken.replacingOccurrences(of: "<?>", with: "").replacingOccurrences(of: "<!>", with: "")
        let reversed = String(strToken.reversed())
        return reversed //Bundle.main.object(forInfoDictionaryKey: "WEBLOGIN_PASSWORD") as! String
    }
}
