//
//  String+Extensions.swift
//  SearchMovieUIKit
//
//  Created by ioannis on 27/11/23.
//

import Foundation

extension String {
    
    var urlEncoded: String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
}
