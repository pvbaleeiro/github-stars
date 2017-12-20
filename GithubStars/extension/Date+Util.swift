//
//  Date+Util.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 18/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation


extension Date {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Formatação
    //-------------------------------------------------------------------------------------------------------------
    static func friendlyDate(dateForFormat: String?) -> String {
        
        guard let dateF = dateForFormat else {
            return "-"
        }
        
        //Convert to date
        let dateFormated: Date = Date.convertStringToDate(dateToConvert: dateF)
                
        //New format
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE d MMM yyyy - HH:mm"
        let formatedString: String = dateFormatter.string(from: dateFormated).replacingOccurrences(of: "-", with: "às")
        print("Data formatada: " + formatedString)
        
        return formatedString
    }
    
    static func convertStringToDate(dateToConvert: String) -> Date {
        
        //Convert to date
        let dateFormatter: DateFormatter = DateFormatter()
        let calendar: Calendar = Calendar.init(identifier: .gregorian)
        let locale: Locale = Locale.init(identifier: "pt_BR")
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.calendar = calendar
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.locale = locale
        let dateFormated: Date = dateFormatter.date(from: dateToConvert)!
        
        return dateFormated
    }
}
