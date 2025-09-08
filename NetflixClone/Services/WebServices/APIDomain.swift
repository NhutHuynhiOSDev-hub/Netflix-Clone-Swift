//
//  Environment.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

enum APIDomain {
    case movieDB(enviroment: Enviroment = .staging)
    case youtube(enviroment: Enviroment = .staging)
    
    enum Enviroment {
        case staging
        case production
    }
    
    var domain: String {
        switch self {
        case .movieDB(enviroment: .staging):
            return "https://api.themoviedb.org"
        case .movieDB(enviroment: .production):
            return "https://api.themoviedb.org"
        case .youtube(enviroment: .staging):
            return "https://youtube.googleapis.com/youtube"
        case .youtube(enviroment: .production):
            return "https://youtube.googleapis.com/youtube"
        }
    }
}
