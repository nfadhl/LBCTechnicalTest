//
//  NetworkClientProtocol.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation

protocol NetworkClientProtocol {
    func makeAPICall(url: URL) async throws -> Data
}
