//
//  AdDetailsViewModelTest.swift
//  LBCTechnicalTestTests
//
//  Created by Fadhl Nader on 15/06/2024.
//

import XCTest
@testable import LBCTechnicalTest

final class AdDetailsViewModelTest: XCTestCase {

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
        let adDetailsViewModel = AdDetailsViewModel(adViewModel: AdViewModel(ad: AdModel(ad: ad!)))
        
        //Then
        XCTAssertEqual(adDetailsViewModel.adID,1461267313)
        XCTAssertEqual(adDetailsViewModel.title,"Statue homme noir assis en plâtre polychrome")
        XCTAssertEqual(adDetailsViewModel.isUrgent,false)
        XCTAssertEqual(adDetailsViewModel.price,"€140.00")
        XCTAssertEqual(adDetailsViewModel.image,"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg")
        XCTAssertEqual(adDetailsViewModel.creationDate,"6 November 2019")
        XCTAssertEqual(adDetailsViewModel.description,"Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.  Poids  1,900 kg en très bon état, aucun éclat  !  Hauteur 18 cm  Largeur : 16 cm Profondeur : 18cm  Création Jacky SAMSON  OPTIMUM  PARIS  Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible")
    }

}

