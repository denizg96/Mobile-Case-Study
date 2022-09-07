//
//  Results.swift
//  Mobile Case Study
//
//  Created by Deniz Gülbahar on 6.09.2022.
//

import Foundation
class Results: Codable {
    let artistName: String?
    let id: String?
    let releaseDate: String?
    let name: String?
    let kind: String?
    let artistId: String?
    let contentAdvisoryRating: String?
    let artistUrl: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?
    
    init(artistName: String, id: String, releaseDate: String, name: String, kind: String, artistId: String, contentAdvisoryRating: String, artistUrl: String, artworkUrl100: String, genres: [Genre], url: String) {
        self.artistName = artistName
        self.id = id
        self.releaseDate = releaseDate
        self.name = name
        self.kind = kind
        self.artistId = artistId
        self.contentAdvisoryRating = contentAdvisoryRating
        self.artistUrl = artistUrl
        self.artworkUrl100 = artworkUrl100
        self.genres = genres
        self.url = url
    }
}
