//
//  WebService.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import Foundation

enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
    
    var method: String {
        switch self {
        case .get: 
            return "GET"
        case .put: 
            return "PUT"
        case .post: 
            return "POST"
        case .delete: 
            return "DELETE"
        }
    }
}

struct WebServices {

    static func request<T: BaseResponseProtocol & Decodable>(
        apiEndpoint: APIEndpoint,
        completion: @escaping(Result<T, APIError>) -> Void
    ) {
        guard var urlComponents = URLComponents(string: apiEndpoint.domain.domain + apiEndpoint.path.path) else {
            completion(.failure(.invalidURL))
            return
        }
        
        if let query = apiEndpoint.query, !query.isEmpty {
            urlComponents.queryItems = query.map{ URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let url = urlComponents.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = apiEndpoint.method.method
        
        switch apiEndpoint.domain {
        case .movieDB(enviroment: .staging), .movieDB(enviroment: .production):
            let token = APIHeader.authenToken ?? ""
            request.allHTTPHeaderFields = ["Content-Type": "application/json", "Accept": "application/json", "Authorization": "Bearer \(token)"]
            
        case .youtube(enviroment: .staging), .youtube(enviroment: .production):
            request.allHTTPHeaderFields = ["Content-Type": "application/json", "Accept": "application/json"]
        }
        
        if let body = apiEndpoint as? HasBody {
            request.httpBody = body.body
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
