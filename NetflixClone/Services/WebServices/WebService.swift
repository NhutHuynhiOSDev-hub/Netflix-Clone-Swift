//
//  WebService.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import Foundation

enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

struct WebService {

    static func request<T: BaseResponseProtocol & Decodable>(
        environment: Environment,
        endpoint: APIPath,
        method: HTTPMethod,
        body: Data? = nil,
        completion: @escaping (Result<T, APIError>) -> Void
    ) {
        let urlString = environment.domain + endpoint.path
        guard let url = URL(string: urlString) else {
            completion(.failure(.badRequest))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body

        // Thêm header
        let headers = APIHeader.defaultHeaders()
        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.network))
                return
            }

            guard let data = data else {
                completion(.failure(.unknown))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let decoded = try decoder.decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.unprocessable))
            }
        }.resume()
    }
}
