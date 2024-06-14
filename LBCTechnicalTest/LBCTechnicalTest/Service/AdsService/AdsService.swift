//
//  AdsService.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation

final class AdsService: AdsServiceProtocol {
    
    private let networkClient: NetworkClientProtocol
    
    private var path: String {
        return (URLsManager.shared.getBaseURL() ?? "")+"/listing.json"
    }
    
    init(networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetchAds() async throws -> [AdDTO] {
        
        guard let url = URL(string: path) else {
            throw NetworkError.invalidURL
        }
        let data  = try await networkClient.makeAPICall(url: url)
        do {
            let ads = try JSONDecoder().decode([AdDTO].self, from: data)
            return ads
        } catch {
            throw NetworkError.decodeError
        }
    }
}
