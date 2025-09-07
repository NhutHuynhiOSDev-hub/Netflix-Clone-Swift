//
//  Environment.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

enum Environment {
    case staging
    case production
    
    var domain: String {
        switch self {
        case .staging:
            return "https://api.themoviedb.org"
        case .production:
            return "https://api.themoviedb.org"
        }
    }
    
    var youtubeDomain: String {
        switch self {
        case .staging:
            return "https://youtube.googleapis.com"
//            GET https://youtube.googleapis.com/youtube/v3/search?key=[YOUR_API_KEY] HTTP/1.1
        case .production:
            return "https://youtube.googleapis.com"
        }
    }
}
