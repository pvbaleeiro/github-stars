//
//  Owner.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation
import ObjectMapper


class Owner: Mappable {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    var avatarUrl: String?
    var url: String?
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Construtor
    //-------------------------------------------------------------------------------------------------------------
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        avatarUrl <- map["avatar_url"]
        url <- map["url"]
    }
}
