//
//  Endpoint.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import Foundation

enum APIPath {
    
    case getTrendingMovies
    var path: String {
        switch self {
        case .getTrendingMovies:
            return "/3/trending/movie/day?language=en-US"
        }
    }
}
