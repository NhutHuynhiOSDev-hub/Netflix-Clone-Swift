//
//  APIPAth.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 8/9/25.
//

import Foundation

enum APIPath {
    
    // Movies
    case movieImage(Int)
    case popularMovies
    case trendingMovies
    case topRatedMovies
    case upcomingMovies
    case nowPlayingMovies
    case movieDetails(Int)
    case searchMovies(String)
    // Shows
    case trendingTVShows
    // Youtube
    case youtubeVideoSearch(String)
    
    var path: String {
        switch self {
        case .popularMovies:
            return "/3/movie/popular"
        case .trendingMovies:
            return "/3/trending/movie/day"
        case .topRatedMovies:
            return "/3/movie/top_rated"
        case .upcomingMovies:
            return "/3/movie/upcoming"
        case .movieDetails(let id):
            return "/3/movie/\(id)"
        case .nowPlayingMovies:
            return "/3/movie/now_playing"
        case .movieImage(let id):
            return "/3/movie/\(id)/images"
        case .searchMovies(let query):
            return "/3/search/movie?include_adult=false&language=en-US&page=1&query=\(query)"
        case .trendingTVShows:
            return "/3/trending/tv/day?language=en-US"
        case .youtubeVideoSearch(let query):
            return "/v3/search?q=\(query)&key=AIzaSyCHTB9kUj9WUsRCd91hw58TFSRvgapnJQY"
        }
    }
}
