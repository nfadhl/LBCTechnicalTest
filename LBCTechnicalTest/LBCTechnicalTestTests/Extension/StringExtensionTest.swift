//
//  StringExtensionTest.swift
//  LBCTechnicalTestTests
//
//  Created by Fadhl Nader on 14/06/2024.
//

import XCTest

@testable import LBCTechnicalTest

final class StringExtensionTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConvertToDefaultDate(){
        //Given
        let dateString = "2019-11-05T15:56:59+0000"
        
        //When
        let date = dateString.convertDateString()
       
        //Then
        XCTAssertEqual(date, "5 November 2019")
        
    }

}


