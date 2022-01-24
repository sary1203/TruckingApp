//
//  NumberFormatterExtension.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/14/22.
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
