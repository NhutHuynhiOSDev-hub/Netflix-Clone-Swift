//
//  HomeViewModel.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 5/9/25.
//

import RxSwift
import Foundation

class HomeViewModel {

    private let repository: HomeRepository
    private let disposeBag = DisposeBag()

    let trendingMovies  = PublishSubject<[Movie]>()
    let errorMessage    = PublishSubject<String>()

    init(repository: HomeRepository = HomeRepository()) {
        self.repository = repository
    }

    func fetchTrendingMovies() {
        repository.fetchTrendingMovies()
            .subscribe(
                onNext: { [weak self] response in
                    self?.trendingMovies.onNext(response.results)
                },
                onError: { [weak self] error in
                    self?.errorMessage.onNext(error.localizedDescription)
                }
            ).disposed(by: disposeBag)
    }
}

