//
//  TrendingMoviesResponse.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 8/9/25.
//

import Foundation

struct TrendingMoviesResponse: Decodable, BaseResponseProtocol {
    
    var statusCode  : Int?
    var message     : String?
    var results     : [Movie]

}
