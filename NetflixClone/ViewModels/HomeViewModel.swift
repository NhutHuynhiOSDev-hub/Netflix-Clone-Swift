//
//  HomeViewModel.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import Foundation

enum HomeDataType {
    case topRatedMovies([Movie])
    case trendingMovies([Movie])
}


class HomeViewModel {

    private let homeRepository: HomeRepositoryProtocol
    
    var onDataUpdate:((HomeDataType) -> Void)?
    var onErrorUpdate:((String) -> Void)?

    init(homeRepository: HomeRepository = HomeRepository()) {
        self.homeRepository = homeRepository
    }

    func fetchTrendingMovies(page: Int = 1) {
        homeRepository.fetchTrendingMovies(page: page) { [weak self] result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self?.onDataUpdate?(.trendingMovies(movies))
                }
            case .failure(let error): print("Error:", error)
                self?.onErrorUpdate?(error.localizedDescription)
            }
        }
    }
}

