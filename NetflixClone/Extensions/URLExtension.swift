//
//  URLExtensions.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 6/9/25.
//

import Foundation

extension URL {
    static func theMovieDBImageURL(for path: String, size: APIImageBase = .medium) -> URL? {
        return URL(string: "https://image.tmdb.org/t/p/\(size)\(path)")
    }
}
