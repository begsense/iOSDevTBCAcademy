//
//  Model.swift
//  ClassWork19_BegiK
//
//  Created by M1 on 19.04.2024.
//

import UIKit

struct ImediNews: Decodable {
    var Title: String?
    var Time: String?
    var Url: String?
    var newsType: Int
    var PhotoUrl: String?
    var PhotoAlt: String?

    private enum CodingKeys: String, CodingKey {
        case Title, Time, Url, PhotoUrl, PhotoAlt
        case newsType = "Type"
    }
}

struct ImediNewsList: Decodable {
    var List: [ImediNews]
}
