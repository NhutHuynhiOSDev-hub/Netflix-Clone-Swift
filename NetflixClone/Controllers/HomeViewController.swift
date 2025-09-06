//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 4/9/25.
//

import UIKit
import RxSwift

enum HomeSections: Int {
    case TrendingMovie = 0
    case TrendingTV = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
//    case TVShows = 5
}

class HomeViewController: UIViewController {
    
    private let disposeBag      = DisposeBag()
    private let viewModel       = HomeViewModel()
    
    private var trendingMovies  = [Movie]()
    private let sectionTitle    = ["Trending Movies", "Popular", "TV Shows", "Trending TV", "Upcomming Movies", "Top Rated"]
    
    private let homeFeedTable: UITableView = {
        let feedTable = UITableView(frame: .zero, style: .grouped)
        
        feedTable.register(HomeColletionViewTableViewCell.self, forCellReuseIdentifier: HomeColletionViewTableViewCell.identifier)
        
        return feedTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
        self.configNavbar()
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.homeFeedTable.frame = self.view.bounds
    }
    
    
    private func setupView() {
        
        bindViewModel()
        self.loadHomeData()
        
        if let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String {
            print("API Key: \(apiKey)")
        }
        
        self.view.addSubview(self.homeFeedTable)
        
        self.homeFeedTable.delegate         = self
        self.homeFeedTable.dataSource       = self
        self.homeFeedTable.tableHeaderView  = UIView(frame: CGRect(
            x:0,
            y:0,
            width: self.view.bounds.width,
            height: self.view.bounds.height))
        
        let heroHeaderView = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 450))
        self.homeFeedTable.tableHeaderView = heroHeaderView
    }
    
    private func configNavbar() {
        let rawLogo = UIImage(named: "app_logo")
        let smallLogo = rawLogo?.resized(to: CGSize(width: 25, height: 25))?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: smallLogo, style: .done, target: self, action: nil)
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    private func bindViewModel() {
        
        // Trending movies
        viewModel.trendingMovies
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] movies in
                self?.trendingMovies = movies
                self?.homeFeedTable.reloadSections(IndexSet(integer: HomeSections.TrendingMovie.rawValue), with: .automatic)
            }).disposed(by: disposeBag)
        
        viewModel.errorMessage
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] message in
                self?.showAlert(message)
            }).disposed(by: disposeBag)
    }
    
    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func loadHomeData() {
        
        self.viewModel.fetchTrendingMovies()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionTitle.count
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        header.textLabel?.textColor = .label
        header.textLabel?.font      = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.text      = header.textLabel?.text?.capitalizingFirstLetter()
        header.textLabel?.frame     = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let homeColletionViewTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeColletionViewTableViewCell.identifier, for: indexPath) as? HomeColletionViewTableViewCell else { return UITableViewCell()
        }
        
        switch indexPath.section {
        case HomeSections.TrendingMovie.rawValue:
            homeColletionViewTableViewCell.configure(with: self.trendingMovies)
            
        default : break
        }
        
        return homeColletionViewTableViewCell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offsetY = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: -offsetY)
    }
}
