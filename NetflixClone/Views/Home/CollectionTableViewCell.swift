//
//  CollectionTableViewCell.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 4/9/25.
//

import UIKit

class HomeColletionViewTableViewCell: UITableViewCell {
    
    static let identifier = "HomeColletionViewTableViewCell"
    
    private var title: [Movie] = [Movie]()
    
    private let collectionView: UICollectionView = {
        let layout              = UICollectionViewFlowLayout()
        layout.scrollDirection  = .horizontal
        layout.itemSize         = CGSize(width: 140, height: 200)
        
        let collectionView      = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.collectionView.frame = self.contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
    
        self.contentView.addSubview(self.collectionView)
        self.contentView.backgroundColor = .systemGray
        
        self.collectionView.delegate    = self
        self.collectionView.dataSource  = self
    }
    
    public func configure(with movie: [Movie]) {
        self.title = movie
//        self.collectionView.reloadData()
    }
}

extension HomeColletionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.title.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let titleCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for:  indexPath) as? TitleCollectionViewCell else { return UICollectionViewCell() }
        
        titleCollectionViewCell.configure(with: self.title[indexPath.row].posterPath)
        
        return titleCollectionViewCell
    }
}
        
