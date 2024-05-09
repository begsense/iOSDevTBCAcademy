//
//  ModelForPhotos.swift
//  ClassWork24_BegiK
//
//  Created by M1 on 09.05.2024.
//

import Foundation

struct Photos: Decodable {
    let urls: Urls
}

struct Urls: Decodable {
    let regular: String
}


//struct Photo: Codable, Hashable {
//    let id: String
//    let urls: PhotoURLs
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    
//    static func == (lhs: Photo, rhs: Photo) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
// 
//struct PhotoURLs: Codable {
//    let regular: URL
//}
