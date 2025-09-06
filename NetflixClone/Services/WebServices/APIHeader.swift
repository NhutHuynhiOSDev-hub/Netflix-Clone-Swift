//
//  APIHeader.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import Foundation

struct APIHeader {
    static var authToken: String? {
        // Lấy token từ UserDefaults, Keychain, hoặc Storage nào bạn dùng
        return "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMDJiNWJjNWVkZDZhNDc0OWIyYmMyNjQ4NmQ5ZDAzMSIsIm5iZiI6MTczMDEwMzc0OC4xNzgsInN1YiI6IjY3MWY0OWM0MjdiZDU3ZDkxZjYzMWU2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WsJMQIB36envkyt81Z8MblyjlegNx5uDyuQ18AOsDCM"
    }

    static func defaultHeaders() -> [String: String] {
        var headers = [String: String]()
        headers["Content-Type"] = "application/json"
        if let token = authToken {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }
}
