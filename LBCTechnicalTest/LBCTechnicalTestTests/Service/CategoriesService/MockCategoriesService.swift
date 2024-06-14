//
//  MockCategoriesService.swift
//  LBCTechnicalTestTests
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation
@testable import LBCTechnicalTest

final class MockCategoriesService: NetworkClientProtocol {
    func makeAPICall(url: URL) async throws -> Data {
        let jsonString = """
                    [
                      {
                        "id": 1,
                        "name": "Véhicule"
                      },
                      {
                        "id": 2,
                        "name": "Mode"
                      },
                      {
                        "id": 3,
                        "name": "Bricolage"
                      },
                      {
                        "id": 4,
                        "name": "Maison"
                      }
                ]
                """
        return jsonString.data(using: .utf8)!
    }
}

