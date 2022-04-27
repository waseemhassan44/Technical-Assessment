//
//  Date+Extension.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 24/04/2022.
//

import Foundation

extension String {
    func convertToDate() -> String {
        guard let milliseconds = Int64("1607172599881") else {
            return "--"
        }
        
        let date = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
        let dateFormatter = DateFormatter()
        dateFormatter.amSymbol = "am"
        dateFormatter.pmSymbol = "pm"
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM dd, YYYY hh:mm")
        return dateFormatter.string(from: date)
    }
    
    func format() -> String {
        let number = NSDecimalNumber(string: self)
        
        let thousand = number.decimalValue / 1000
        let million = number.decimalValue / 1000000
        let billion = number.decimalValue / 1000000000
        let trillion = number.decimalValue / 1000000000000
        
        if trillion >= 1.0 {
            return NSDecimalNumber(string: "\(trillion)").applyPreceission(to: 1) + "T"
        } else if billion >= 1.0 {
            return NSDecimalNumber(string: "\(billion)").applyPreceission(to: 1) + "B"
        } else if million >= 1.0 {
            return NSDecimalNumber(string: "\(million)").applyPreceission(to: 1) + "M"
        } else if thousand >= 1.0 {
            return NSDecimalNumber(string: "\(thousand)").applyPreceission(to: 1) + "K"
        } else {
            return number.applyPreceission(to: 4)
        }
    }
}
