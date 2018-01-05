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
    private(set) var id: Int?
    private(set) var name: String?
    private(set) var fullName: String?
    private(set) var description: String?
    private(set) var owner: Owner?
    private(set) var forks: Int?
    private(set) var stargazersCount: Int?
    private(set) var pullsUrl: String?
    
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
