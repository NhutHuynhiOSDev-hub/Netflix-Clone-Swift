//
//  HomeRepository.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import RxSwift
import Foundation

// Repository Protocol
protocol HomeRespositoryProtocol {
    func fetchTrendingMovies() -> Observable<TrendingMoviesResponse>
}

struct HomeRespository: HomeRespositoryProtocol {
    
    let environment: Environment
    
    init(environment: Environment = .staging) {
        
        self.environment = environment
    }
    
    func fetchTrendingMovies() -> Observable<TrendingMoviesResponse> {
        return Observable.create { observer in
            WebService.request(environment: self.environment, endpoint: .getTrendingMovies, method: .get) { (results: Result<TrendingMoviesResponse, APIError>) in
                switch results {
                case .success(let response):
                    observer.onNext(response)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
