//
//  CategoriesService.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation

final class CategoriesService: CategoriesServiceProtocol {
    
    private let networkClient: NetworkClientProtocol
    
    
    private var path: String {
        return (URLsManager.shared.getBaseURL() ?? "")+"/categories.json"
    }
    
    init(networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetchCategories() async throws -> [CategoryDTO] {
        guard let url = URL(string: path) else {
            throw NetworkError.invalidURL
        }
        let data  = try await networkClient.makeAPICall(url: url)
        do {
            let categories = try JSONDecoder().decode([CategoryDTO].self, from: data)
            return categories
        } catch {
            throw NetworkError.decodeError
        }
    }
}
