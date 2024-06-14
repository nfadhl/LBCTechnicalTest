//
//  AdViewModelTest.swift
//  LBCTechnicalTestTests
//
//  Created by Fadhl Nader on 14/06/2024.
//

import XCTest
@testable import LBCTechnicalTest

final class AdViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() async  {
        //Given
        let mockAdsService = MockAdsService()
        let apiClient = AdsService(networkClient: mockAdsService)
        let ad = try? await apiClient.fetchAds().first!
        
        //When
        let adViewModel = AdViewModel(ad: AdModel(ad: ad!))
        
        //Then
        XCTAssertEqual(adViewModel.adID, 1461267313)
        XCTAssertEqual(adViewModel.title,"Statue homme noir assis en plâtre polychrome")
        XCTAssertEqual(adViewModel.isUrgent,false)
        XCTAssertEqual(adViewModel.price,"€140.00")
        XCTAssertEqual(adViewModel.image,"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg")
        XCTAssertEqual(adViewModel.creationDate,"6 November 2019")
    }

}
