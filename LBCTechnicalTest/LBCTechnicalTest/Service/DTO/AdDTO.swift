//
//  AdDTO.swift
//  LBCTechnicalTest
//
//  Created by Fadhl Nader on 14/06/2024.
//

import Foundation

struct AdDTO: Codable {
     let adID: Int
     let categoryID: Int
     let title: String
     let description: String
     let price: Double
     let imagesUrl: ImagesDTO
     let creationDate: String
     let isUrgent: Bool
     let siret: String?
    
    
    enum CodingKeys: String, CodingKey {
        case adID = "id"
        case categoryID = "category_id"
        case title
        case description
        case price
        case imagesUrl = "images_url"
        case creationDate = "creation_date"
        case isUrgent = "is_urgent"
        case siret
    }
    
    struct ImagesDTO: Codable {
       let small: String?
       let thumb: String?
       
   }
    
}
