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
    case token = "1d6ba8f9e302dabdb36dd77c6eafadaa5b81a922"
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
        let credentialStr: String = ConfigManager.credential.user! + ":" + ConfigManager.credential.password!
        let plainData: Data = credentialStr.data(using: .utf8)!
        let encodedUsernameAndPassword: String = plainData.base64EncodedString(options: .init(rawValue: 0))
        headers["Authorization"] = "Basic " + encodedUsernameAndPassword
        return headers
    }
}


