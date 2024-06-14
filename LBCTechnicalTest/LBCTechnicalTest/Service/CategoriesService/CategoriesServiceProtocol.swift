//
//  CategoriesServiceProtocol.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation

protocol CategoriesServiceProtocol {
    // Fetches a list of categories from the Leboncoin API
    func fetchCategories() async throws -> [CategoryDTO]
}
