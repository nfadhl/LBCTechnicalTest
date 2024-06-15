//
//  AdsListViewModel.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation
import Combine

@MainActor
final class AdsListViewModel {
        
    var updateResult = PassthroughSubject<Bool, Never>()
    var adsViewModel = [AdViewModel]()
    private var subscriptions = Set<AnyCancellable>()
    @Published var errorMessage: String?

    
    init() {
        CategoriesRepository.shared.loadAllCategories()
        fetchAds()
    }
    
    // Fetches ads using the LBCAPIClient, converts them into AdViewModel, sorts them by date
    func fetchAds() {
        Task {
            do {
                let ads = try await AdsService().fetchAds()
                ads.forEach { adsViewModel.append(AdViewModel(ad: AdModel(ad: $0))) }
                self.adsViewModel = sortedAdsByDate(ads: self.adsViewModel)
                updateResult.send(true)
            } catch {
                if let apiError = error as? NetworkError {
                    self.errorMessage = apiError.rawValue
                } else {
                    self.errorMessage = "An error occurred"
                }
                updateResult.send(false)
            }
        }
    }
    
    // Sorting the ads by date
    func sortedAdsByDate(ads: [AdViewModel]) -> [AdViewModel] {
        return ads.sorted { (firstAd, secondAd) -> Bool in
                return firstAd.creationDate > secondAd.creationDate
        }
    }
}
