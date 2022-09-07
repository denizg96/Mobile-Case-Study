//
//  Feed.swift
//  Mobile Case Study
//
//  Created by Deniz Gülbahar on 6.09.2022.
//

import Foundation
class Feed:Codable {
    let title: String?
    let id: String?
    let author: Author?
    let copyright: String?
    let country: String?
    let icon: String?
    let updated: String?
    let results: [Results]?
    init(title: String, id: String, author: Author,copyright: String, country: String, icon: String, updated:String, results: [Results]) {
        self.title = title
        self.id = id
        self.author = author
        self.copyright = copyright
        self.country = country
        self.icon = icon
        self.updated = updated
        self.results = results
    }
    
}
