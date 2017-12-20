//
//  APIResponse.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation
import ObjectMapper

class APIResponse {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    var connected: Bool = false //Control connection in requests
    var objectFromServer: Any! //Object response
    var friendlyMessage: String! //Message for user
    var httpCode: Int = 0 //Http code response
}

class APIResponseObject: Mappable {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Construtor
    //-------------------------------------------------------------------------------------------------------------
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        print(map)
    }
}

