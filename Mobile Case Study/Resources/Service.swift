//
//  Helpers.swift
//  Mobile Case Study
//
//  Created by Deniz Gülbahar on 5.09.2022.
//

import Foundation
import UIKit

 class Service {

    func newsURL(searchText: String, category: Int, mediatype:Int,type:Int) -> URL? {
        
    let baseURL:String = "https://rss.applemarketingtools.com/api/v2/"
    let country:String = "us/"
    let amount:String = "20/"
    let format:String = ".json"
    let categories:String
    let mediatypes:String
    let types:String
        
    switch category {
    case 0: categories = "most-played/"
    case 1: categories = "top-free/"
    case 2: categories = "top/"
    default:categories = ""
    }
    switch mediatype {
    case 0: mediatypes = "music/"
    case 1: mediatypes = "books/"
    case 2: mediatypes = "audio-books/"
    default:mediatypes = ""
    }
    switch type {
    case 0: types = "songs"
    case 1: types = "books"
    case 2: types = "audio-books"
    default:types = ""
    }
        
    let url = URL(string:"\(baseURL)\(country)\(mediatypes)\(categories)\(amount)\(types)\(format)")
    return url
  }
}

