//
//  AdDetailsViewModel.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation


final class AdDetailsViewModel : ObservableObject {
    
    @Published  var adID: Int
    @Published  var title: String = ""
    @Published  var categoryName: String = ""
    @Published  var creationDate: String = ""
    @Published  var price: String = ""
    @Published  var image: String = ""
    @Published  var isUrgent: Bool = false
    @Published  var description: String = ""
    @Published  var siret: String?
    
    
   // Initializes an AdDetailsViewModel using AdViewModel
    init(adViewModel: AdViewModel) {
        self.adID = adViewModel.adID
        self.title = adViewModel.title
        self.categoryName = adViewModel.categoryName
        self.image = adViewModel.image
        self.isUrgent = adViewModel.isUrgent
        self.price = adViewModel.price
        self.creationDate = adViewModel.creationDate
        self.description = adViewModel.ad.ad.description
        if let siret = adViewModel.ad.ad.siret {
            self.siret = siret
        }
    }
}


