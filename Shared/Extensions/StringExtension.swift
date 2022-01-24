//
//  StringExtension.swift
//  TruckingApp (iOS)
//
//  Created by Randy Flores on 1/15/22.
//

import Foundation


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
