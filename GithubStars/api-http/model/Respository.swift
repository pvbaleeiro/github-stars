//
//  Respository.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation
import ObjectMapper


class Repository: Mappable {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    var id: Int?
    var name: String?
    var fullName: String?
    var description: String?
    var owner: Owner?
    var forks: Int?
    var stargazersCount: Int?
    var pullsUrl: String?
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Construtor
    //-------------------------------------------------------------------------------------------------------------
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        owner <- map["name"]
        fullName <- map["full_name"]
        description <- map["description"]
        owner <- map["owner"]
        forks <- map["forks"]
        stargazersCount <- map["stargazers_count"]
        pullsUrl <- map["pulls_url"]
    }
}
