//
//  AdModelTest.swift
//  LBCTechnicalTestTests
//
//  Created by Fadhl Nader on 14/06/2024.
//

import XCTest

@testable import LBCTechnicalTest

final class AdTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testAdModel() async {
        //Given
        let mockAdsService = MockAdsService()
        let apiClient = AdsService(networkClient: mockAdsService)
        let ad = try? await apiClient.fetchAds().first!
    
        //When
        let adModel = AdModel(ad: ad!)
        
        //Then
        XCTAssertEqual(adModel.adID, 1461267313)
        XCTAssertEqual(adModel.title, "Statue homme noir assis en plâtre polychrome")
        XCTAssertEqual(adModel.categoryID, 4)
        XCTAssertEqual(adModel.creationDate,"2019-11-06T15:56:59+0000")
        XCTAssertEqual(adModel.price, 140.00)
        XCTAssertEqual(adModel.image, "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg")
        XCTAssertEqual(adModel.isUrgent,false)
    }
}

