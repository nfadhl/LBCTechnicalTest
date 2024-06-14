//
//  CategoryModelTest.swift
//  LBCTechnicalTestTests
//
//  Created by Fadhl Nader on 14/06/2024.
//

import XCTest

@testable import LBCTechnicalTest

final class CategoryModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCategoryModel() async {
        //Given
        let mockCategoriesService = MockCategoriesService()
        let apiClient = CategoriesService(networkClient: mockCategoriesService)
        let categorie = try? await apiClient.fetchCategories().first
    
        //When
        let categoryModel = CategoryModel(category: categorie!)
        
        //Then
        XCTAssertEqual(categoryModel.categoryID, 1)
        XCTAssertEqual(categoryModel.name, "Véhicule")
    }
}
