//
//  String+Extension.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation

extension String {
    func convertDateString() -> String? {
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatterInput.date(from: self) {
            let dateFormatterOutput = DateFormatter()
            dateFormatterOutput.dateFormat = "d MMMM yyyy"
            let formattedDate = dateFormatterOutput.string(from: date)
            return formattedDate
        } else {
            return nil
        }
    }
}
