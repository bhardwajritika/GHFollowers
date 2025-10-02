//
//  String+Ext.swift
//  GHFollowers
//
//  Created by Tarun Sharma on 28/09/25.
//

import Foundation


extension String {
    
    func convertToDate() -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)!
    }
    
    func convertToDisplayFormat() -> String {
        let date = self.convertToDate()
        return date.convertDateToMonthYear()
    }
}
