//
//  CategoriesServiceTest.swift
//  LBCTechnicalTestTests
//
//  Created by Fadhl Nader on 14/06/2024.
//

import XCTest
@testable import LBCTechnicalTest

final class CategoriesServiceTest: XCTestCase {
    
    var apiClient: CategoriesService!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testfetchCategories() async {
        //Given
        let mockCategoriesService = MockCategoriesService()
        apiClient = CategoriesService(networkClient: mockCategoriesService)
        
        //When
        let categories = try? await apiClient.fetchCategories()
        
        //Then
        XCTAssertEqual(categories?.count, 4)
        XCTAssertEqual(categories?.first?.categoryID, 1)
        XCTAssertEqual(categories?.first?.name, "Véhicule")
    }
}
