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
}
