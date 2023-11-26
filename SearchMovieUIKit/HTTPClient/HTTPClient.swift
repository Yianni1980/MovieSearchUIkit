//
//  HTTPClient.swift
//  SearchMovieUIKit
//
//  Created by ioannis on 27/11/23.
//

import Foundation
import Combine

enum NetworkError:Error {
    case badUrl
}

class HTTPClient {
    
    func fetchMovies(search:String) ->AnyPublisher<[Movie],Error> {
        guard let encodedSearch = search.urlEncoded?.urlEncoded,
              let url = URL(string: "https://www.omdbapi.com/?s=\(encodedSearch)&page=2&apiKey=2d3860ab")
        else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponce.self, decoder: JSONDecoder())
            .map(\.Search)
            .receive(on: DispatchQueue.main)
            .catch { error -> AnyPublisher<[Movie],Error> in
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
}
