//
//  UpcomingTableViewCell.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 6/9/25.
//

import UIKit
import SDWebImage

class UpcomingTableViewCell: UITableViewCell {
    
    static let identifier = "UpcomingTableViewCell"
    
    private let titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 3
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private let posterImage: UIImageView = {
        
        let posterImage = UIImageView()
        
        posterImage.contentMode = .scaleAspectFill
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        
        return posterImage
    }()
    
    private let playButton: UIButton = {
        
        let playButton = UIButton()
        let btnImage   = UIImage(systemName: "play.circle", withConfiguration:  UIImage.SymbolConfiguration(pointSize: 40))
        
        playButton.setImage(btnImage, for: .normal)
        
        playButton.tintColor        = .white
        playButton.clipsToBounds    = true
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        return playButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func setupView() {
        
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.playButton)
        self.contentView.addSubview(self.posterImage)
    }
    
    private func setupConstraints() {
        
        let posterImageConstraint = [
            self.posterImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            self.posterImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.posterImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            self.posterImage.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let playButtonConstraint = [
            self.playButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.playButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant:  0),
        ]
        
        let titleConstraints = [
            self.titleLabel.leadingAnchor.constraint(equalTo: self.posterImage.trailingAnchor, constant: 8),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.playButton.leadingAnchor, constant: 8),
            self.posterImage.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 16),
            self.posterImage.bottomAnchor.constraint(greaterThanOrEqualTo: self.contentView.bottomAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(posterImageConstraint)
        NSLayoutConstraint.activate(playButtonConstraint)
        NSLayoutConstraint.activate(titleConstraints)
    }
    
    public func renderView(media: Movie) {
        self.titleLabel.text = media.title
        
        guard let imageURL = URL.theMovieDBImageURL(for: media.posterPath, size: .small) else { return }
        
        self.posterImage.sd_setImage(with: imageURL, completed: nil)
    }
}
