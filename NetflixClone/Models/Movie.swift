//
//  Movie.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import Foundation

struct Movie: Decodable {
    
    let id                  : Int
    let voteCount           : Int
    let video               : Bool
    let adult               : Bool
    let popularity          : Double
    let voteAverage         : Double
    let title               : String
    let overview            : String
    let mediaType           : String
    let posterPath          : String
    let releaseDate         : String
    let backdropPath        : String
    let originalTitle       : String
    let originalLanguage    : String
    let genreIds            : [Int]
}
