//
//  AdModel.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation

struct AdModel {
    var ad: AdDTO
    var adID: Int
    var title: String
    var categoryID: Int
    var creationDate: String
    var price: Double
    var image: String
    var isUrgent: Bool
    var siret: String?

    init(ad: AdDTO) {
        self.ad = ad
        self.adID = ad.adID
        self.title = ad.title
        self.categoryID = ad.categoryID
        self.creationDate = ad.creationDate
        self.price = ad.price
        self.image = ad.imagesUrl.thumb ?? ""
        self.isUrgent = ad.isUrgent
        self.siret = ad.siret
    }
}
