//
//  ModelMain.swift
//  Mobile Case Study
//
//  Created by Deniz Gülbahar on 5.09.2022.
//

import Foundation
class Attributes:Codable {
    let name:String?
    let releaseDate:String?
    var artwork:[Artwork]?
    init(name:String, releaseDate:String, artwork:[Artwork]) {
        self.name = name
        self.releaseDate = releaseDate
        self.artwork = artwork
    }
}
