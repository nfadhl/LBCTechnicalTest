//
//  AdViewModel.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation

final class AdViewModel: Identifiable {
    var ad: AdModel
    var adID: Int
    var title: String
    var categoryName: String
    var creationDate: String
    var price: String = ""
    var image: String
    var isUrgent: Bool
    
    init(ad: AdModel) {
        self.ad = ad
        self.adID = ad.adID
        self.title = ad.title
        self.image = ad.image
        self.isUrgent = ad.isUrgent
        self.creationDate = ad.creationDate.convertDateString() ?? ""
        self.categoryName = CategoriesRepository.shared.categories.first(where: { $0.categoryID == ad.categoryID })?.name ?? ""
        self.price = self.formatCurrency(ad.price, currencyCode: "EUR")
    }
    
    func formatCurrency(_ value: Double, currencyCode: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
}

