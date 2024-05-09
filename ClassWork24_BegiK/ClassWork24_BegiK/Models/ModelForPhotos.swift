//
//  ModelForPhotos.swift
//  ClassWork24_BegiK
//
//  Created by M1 on 09.05.2024.
//

import Foundation

struct Photos: Decodable {
    let id: String
    let urls: Urls
}

struct Urls: Decodable {
    let regular: String
}
