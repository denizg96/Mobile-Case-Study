//
//  Author.swift
//  Mobile Case Study
//
//  Created by Deniz Gülbahar on 6.09.2022.
//

import Foundation
struct Author: Codable {
    let name: String?
    let url: String?

    init(name: String,url: String) {
        self.name = name
        self.url = url
    }
}
