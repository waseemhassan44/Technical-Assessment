//
//  NSDecimal+Extension.swift
//  TechnicalChallenge
//
//  Created by waseemhassan on 26/04/2022.
//

import Foundation

extension NSDecimalNumber {
    func applyPreceission(to digit: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = digit
        numberFormatter.maximumFractionDigits = digit
        return numberFormatter.string(from: self) ?? "\(self.decimalValue)"
    }
}
