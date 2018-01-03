//
//  ConfigManager.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation
import Alamofire


//-------------------------------------------------------------------------------------------------------------
// MARK: Enpoint
//-------------------------------------------------------------------------------------------------------------
enum ServerEndpoint: String {
    case github = "https://api.github.com"
}

//Don't this in real world :|
enum Credential: String {
    case user = "baleeiro-hub"
    case token = "b<!>ca49506<?>ad38<!>214<?>25b4<!>f881<?>41099<!>846<?>a80<!>83a66b<?>"
}


class ConfigManager {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Singleton
    //-------------------------------------------------------------------------------------------------------------
    static let sharedInstance = ConfigManager()
    static let credential: URLCredential = URLCredential.init(user: Credential.user.rawValue, password: Credential.token.rawValue, persistence: .none)
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: METODOS
    //-------------------------------------------------------------------------------------------------------------
    func endpoint() -> String {
        return ServerEndpoint.github.rawValue
    }
    
    func defaultHeaders() -> HTTPHeaders {
        var headers:HTTPHeaders = HTTPHeaders()
        headers["Content-Type"] = "application/json"
        
        //Adjust token
        var strToken = ConfigManager.credential.password!
        strToken = strToken.replacingOccurrences(of: "<?>", with: "").replacingOccurrences(of: "<!>", with: "")
        let reversed = String(strToken.reversed())
        
        //Lets
        let credentialStr: String = ConfigManager.credential.user! + ":" + reversed
        let plainData: Data = credentialStr.data(using: .utf8)!
        let encodedUsernameAndPassword: String = plainData.base64EncodedString(options: .init(rawValue: 0))
        headers["Authorization"] = "Basic " + encodedUsernameAndPassword
        return headers
    }
}


