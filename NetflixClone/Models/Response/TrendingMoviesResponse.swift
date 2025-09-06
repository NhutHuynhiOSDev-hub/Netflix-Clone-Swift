//
//  TrendingMoviesResponse.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import Foundation

struct TrendingMoviesResponse: Decodable, BaseResponseProtocol {
    
    let statusCode  : Int?
    let message     : String?
    let page        : Int
    let totalPages  : Int
    let totalResults: Int
    let results     : [Movie]
}
