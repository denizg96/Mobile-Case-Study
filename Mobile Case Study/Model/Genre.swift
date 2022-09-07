//
//  Genre.swift
//  Mobile Case Study
//
//  Created by Deniz Gülbahar on 6.09.2022.
//

import Foundation
struct Genre: Codable {
    let genreId: String?
    let name: String?
    let url: String?
    init(genreId: String, name: String, url: String) {
        self.name = name
        self.genreId = genreId
        self.url = url
    }
}
