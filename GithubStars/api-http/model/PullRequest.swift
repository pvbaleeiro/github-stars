//
//  PullRequest.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 17/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation
import ObjectMapper


class PullRequest: Mappable {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    var title: String?
    var body: String?
    var user: Owner?
    var htmlUrl: String?
    var createdAt: String?
    var updatedAt: String?
    var closedAt: String?
    var state: String?
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Construtor
    //-------------------------------------------------------------------------------------------------------------
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        body <- map["body"]
        user <- map["user"]
        htmlUrl <- map["html_url"]
        createdAt <- map["created_at"]
        updatedAt <- map["updated_at"]
        closedAt <- map["closed_at"]
        state <- map["state"]
    }
}

