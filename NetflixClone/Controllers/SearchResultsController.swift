//
//  SearchResultsController.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 6/9/25.
//

import UIKit

class SearchResultsController: UIViewController {
    
    private let searchResultsCollectionView: UICollectionView = {
        
        let layout      = UICollectionViewFlowLayout()
        let itemWidth   = UIScreen.main.bounds.width / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 2)
        layout.minimumLineSpacing = 8
        
        let searchResultsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        searchResultsCollectionView.register(SearchResultsCollectionCell.self, forCellWithReuseIdentifier: SearchResultsCollectionCell.identifier)
        
        
        return searchResultsCollectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.searchResultsCollectionView.frame = self.view.bounds
    }

    private func setupView() {
        
        self.view.backgroundColor = .systemMint
        self.view.addSubview(self.searchResultsCollectionView)
        
        self.searchResultsCollectionView.delegate   = self
        self.searchResultsCollectionView.dataSource = self
    }
}

extension SearchResultsController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let searchResultsCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultsCollectionCell.identifier, for: indexPath) as? SearchResultsCollectionCell else {
            return UICollectionViewCell()
        }
        
        searchResultsCollectionCell.renderView()
        
        return searchResultsCollectionCell
    }
}
