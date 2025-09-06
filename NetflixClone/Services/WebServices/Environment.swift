//
//  Environment.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

enum Environment {
    case staging
    case production
    
    //    Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
    
    var domain: String {
        switch self {
        case .staging:
            return "https://api.themoviedb.org"
        case .production:
            return "https://api.themoviedb.org"
        }
    }
}
