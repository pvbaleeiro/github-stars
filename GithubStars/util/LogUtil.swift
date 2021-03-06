//
//  LogUtil.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation

class LogUtil {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Log
    //-------------------------------------------------------------------------------------------------------------
    class func log(title: String, forClass: String, method: String, line: Int, description: String) {
        print("\n\n\n---------- \(title) ----------\nClasse: \(forClass)\nMétodo: \(method)\nLinha: \(line)\nDescrição: \(description)\n---------- \(title) ----------\n\n\n")
    }
}
