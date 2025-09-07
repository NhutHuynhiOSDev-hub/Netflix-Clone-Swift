//
//  SearchResultsTableViewCell.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 6/9/25.
//

import UIKit

class SearchResultsCollectionCell: UICollectionViewCell {
    
    static let identifier = "SearchResultsCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame:  frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){}
    
    public func renderView(){}
}
