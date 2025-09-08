//
//  HomeRepository.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import RxSwift
import Foundation

// Repository Protocol
protocol HomeRepositoryProtocol {
    func fetchTrendingMovies(page: Int, completion: @escaping (Result<[Movie], APIError>) -> Void)
}

struct HomeRepository: HomeRepositoryProtocol {
    
    func fetchTrendingMovies(page: Int, completion: @escaping (Result<[Movie], APIError>) -> Void) {
        let movieEndpoint: MovieEndpoint = .getTrendingMovies(page: page)
        WebServices.request(apiEndpoint: movieEndpoint) { (result: Result<TrendingMoviesResponse, APIError>) in
            switch result {
            case .success(let respone):
                completion(.success(respone.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
