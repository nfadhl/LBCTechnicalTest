//
//  AdsServiceTest.swift
//  LBCTechnicalTestTests
//
//  Created by Fadhl Nader on 14/06/2024.
//

import XCTest

@testable import LBCTechnicalTest

final class AdsServiceTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testfetchAds() async {
        
        //Given
        let mockAdsService = MockAdsService()
        let apiClient = AdsService(networkClient: mockAdsService)
        
        //When
        let ads = try? await apiClient.fetchAds()
        
        //Then
        XCTAssertEqual(ads?.count, 3)
        XCTAssertEqual(ads?.first?.categoryID, 4)
        XCTAssertEqual(ads?.first?.adID, 1461267313)
        XCTAssertEqual(ads?.first?.price, 140.00)
        XCTAssertEqual(ads?.first?.title, "Statue homme noir assis en plâtre polychrome")
        XCTAssertNil(ads?.first?.siret)
    }
}

