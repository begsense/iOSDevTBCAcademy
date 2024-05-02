//
//  ModelCatFact.swift
//  ClassWork23_BegiK
//
//  Created by M1 on 02.05.2024.
//

import Foundation

struct FactsResponse: Decodable {
    let data: [Facts]
}

struct Facts: Decodable {
    let fact: String
    let length: Int
}

