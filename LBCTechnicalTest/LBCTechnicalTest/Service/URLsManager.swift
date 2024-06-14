//
//  URLsManager.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation

class URLsManager{
    static var  shared = URLsManager()
    
    func getBaseURL() -> String? {
        guard let path = Bundle.main.path(forResource: "APIURLs", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let plist = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil) as? [String: Any] else {
            return nil
        }
        
        if let baseURLString = plist["BaseURL"] as? String {
            return baseURLString
        }
        
        return nil
    }
}
