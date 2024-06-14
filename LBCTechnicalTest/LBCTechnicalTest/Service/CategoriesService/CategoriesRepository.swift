//
//  CategoriesManager.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation
final class CategoriesRepository: NSObject {

    static let shared = CategoriesRepository()

    var categories: [CategoryDTO] = []

    func loadAllCategories() {
        Task {
            self.categories = try await CategoriesService(networkClient: NetworkClient()).fetchCategories()
        }
    }
}
