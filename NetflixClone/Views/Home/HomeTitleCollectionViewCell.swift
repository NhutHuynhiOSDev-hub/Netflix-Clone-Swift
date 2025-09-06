//
//  HomeTitleCollectionCell.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 6/9/25.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {

    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let posterImageView = UIImageView()
        
        posterImageView.contentMode = .scaleAspectFill
        
        return posterImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        posterImageView.frame = contentView.bounds
    }
    
    private func setupView() {
        contentView.addSubview(posterImageView)
    }
    
    public func configure(with model: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else { return }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
