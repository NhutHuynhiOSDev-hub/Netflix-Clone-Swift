//
//  MovieEndpoint.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 8/9/25.
//

import Foundation

enum MovieEndpoint: APIEndpoint {
    case getTrendingMovies(page: Int)
    case getTopRatedMovies(page: Int)
    
    var domain: APIDomain { .movieDB(enviroment: .staging) }
    
    var path: APIPath {
        switch self {
        case .getTrendingMovies:
            return APIPath.trendingMovies
        case .getTopRatedMovies:
            return APIPath.topRatedMovies
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getTrendingMovies, .getTopRatedMovies:
            return HTTPMethod.get
        }
    }
    var query: [String: String]? {
        switch self {
        case .getTrendingMovies(let page), .getTopRatedMovies(let page):
            return ["page": "\(page)"]
        
        }
    }
    
    var body: Data? { nil }
}
