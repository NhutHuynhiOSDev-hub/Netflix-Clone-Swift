//
//  SearchViewTableCell.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 6/9/25.
//

import UIKit

class SearchViewTableCell: UITableViewCell {
    
    static let identifier = "SearchViewTableCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){}
    
    public func renderView(){}
}


