//
//  Movie.swift
//  SearchMovieUIKit
//
//  Created by ioannis on 27/11/23.
//

import Foundation

struct MovieResponce:Decodable {
    let Search: [Movie]
}

struct Movie:Decodable {
    
    let title:String
    let year:String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
    }
}
