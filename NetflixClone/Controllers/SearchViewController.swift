//
//  SearchViewController.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 4/9/25.
//


import UIKit

class SearchViewController: UIViewController {
    
    private let searchtableView: UITableView = {
        let searchtableView = UITableView()
        
        searchtableView.register(SearchViewTableCell.self, forCellReuseIdentifier: SearchViewTableCell.identifier)
        
        return searchtableView
    }()
    
    private let searchController: UISearchController = {
       let searchController = UISearchController()
        
        searchController.searchBar.searchBarStyle   = .minimal
        searchController.searchBar.placeholder      = "Search for a movie or TV show"
        
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.searchtableView.frame = self.view.bounds
    }
    
    private func setupView() {
        
        self.setupSearchController()
        
        self.view.backgroundColor = .systemBackground
        
        self.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles     = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        self.searchtableView.delegate   = self
        self.searchtableView.dataSource = self
        self.view.addSubview(self.searchtableView)
    }
    
    private func setupSearchController() {
        
        self.navigationItem.searchController = self.searchController
        
        self.searchController.searchResultsUpdater = self
    }
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        
        guard let query = searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty, query.trimmingCharacters(in: .whitespaces).count >= 3 else {
            return
        }
        
        guard let resultsController = searchController.searchResultsController as? SearchResultsController else { return }
         
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let searchViewTableCell = tableView.dequeueReusableCell(withIdentifier: SearchViewTableCell.identifier, for: indexPath) as? SearchViewTableCell else {
            return UITableViewCell()
        }
        
        return searchViewTableCell
    }
}
