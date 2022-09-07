//
//  ArtworkModel.swift
//  Mobile Case Study
//
//  Created by Deniz Gülbahar on 5.09.2022.
//

import Foundation

class Artwork:Codable {
    let url:String?
    
    init(url:String) {
    self.url = url
    }
}
