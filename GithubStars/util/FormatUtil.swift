//
//  FormatUtil.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation

class FormatUtil {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Formata valor amigavel
    //-------------------------------------------------------------------------------------------------------------
    class func friendlyFormatValuePoint(from: Int) -> String {
        let number = Double(from)
        let thousand = number / 1000
        let million = number / 1000000
        
        if million >= 1.0 { return "\(round(million*10)/10)M" }
        else if thousand >= 1.0 { return "\(round(thousand*10)/10)K" }
        else { return "\(Int(number))"}
    }
}


