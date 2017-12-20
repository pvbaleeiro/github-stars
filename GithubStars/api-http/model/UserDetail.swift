//
//  UserDetail.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation
import ObjectMapper


class UserDetail: Mappable {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    var login: String?
    var name: String?
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Construtor
    //-------------------------------------------------------------------------------------------------------------
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        login <- map["login"]
        name <- map["name"]
    }
}

