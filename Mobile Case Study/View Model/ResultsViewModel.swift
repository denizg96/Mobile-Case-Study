//
//  ResultsViewModel.swift
//  Mobile Case Study
//
//  Created by Deniz Gülbahar on 6.09.2022.
//

import Foundation
import SDWebImage

class ResultsViewModel {
    let collectionName:String
    var releaseDate:String
    let artistName:String
    var artworkUrl100:URL?
    
    init(model:Results) {
        collectionName = model.name!
        artistName = model.artistName!
        let date = model.releaseDate
        let dates = date?.components(separatedBy: "-")
        let releasedate = "\(dates![2]).\(dates![1]).\(dates![0])"
        releaseDate = releasedate
    
        guard let artwork = model.artworkUrl100 else {
            return
        }
        if let url = URL(string:artwork) {
            artworkUrl100 = url
        }
 
    }
}
