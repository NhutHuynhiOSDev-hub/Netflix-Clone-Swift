//
//  Endpoint.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import Foundation

protocol HasBody {
    var body: Data? { get }
}

protocol APIEndpoint {
    var domain: APIDomain { get }
    var path: APIPath { get }
    var method: HTTPMethod { get }
    var query: [String: String]? { get }
}
