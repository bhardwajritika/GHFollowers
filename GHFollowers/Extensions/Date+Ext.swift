//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Tarun Sharma on 28/09/25.
//

import Foundation

extension Date {
    
    func convertDateToMonthYear() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
