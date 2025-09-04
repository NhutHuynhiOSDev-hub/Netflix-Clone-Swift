//
//  HeroHeaderView.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 4/9/25.
//

import UIKit

class HeroHeaderView: UIView {
    
    private let playButton: UIButton = {
        let playButton = UIButton()
        playButton.setTitle("Play", for: .normal)
        
        playButton.layer.borderWidth                            = 1
        playButton.layer.cornerRadius                           = 5
        playButton.tintColor                                    = .white
        playButton.layer.borderColor                            = UIColor.white.cgColor
        playButton.translatesAutoresizingMaskIntoConstraints    = false
        
        return playButton
    }()
    
    private let downloadButton: UIButton = {
        let downloadButton = UIButton()
        downloadButton.setTitle("Download", for: .normal)
        
        downloadButton.layer.borderWidth                            = 1
        downloadButton.layer.cornerRadius                           = 5
        downloadButton.tintColor                                    = .white
        downloadButton.layer.borderColor                            = UIColor.white.cgColor
        downloadButton.translatesAutoresizingMaskIntoConstraints    = false
        
        return downloadButton
    }()
    
    private let heroImageView: UIImageView = {
        
        let heroImageView = UIImageView()
        heroImageView.contentMode   = .scaleAspectFill
        heroImageView.clipsToBounds = true
        heroImageView.image         = UIImage(named: "sample_godzilla")
        
        return heroImageView
        
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
        
        self.heroImageView.frame = self.bounds
    }
    
    private func setupView() {
        
        self.addSubview(self.heroImageView)
        self.addGradient()
        
        self.addSubview(self.playButton)
        self.addSubview(self.downloadButton)
        self.applyConstraint()
    }
    
    private func applyConstraint() {
        let playButtonConstraint = [
            self.playButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            self.playButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            self.playButton.widthAnchor.constraint(equalToConstant: 120),
        ]
        
        let downloadButtonConstraint = [
            self.downloadButton.leadingAnchor.constraint(greaterThanOrEqualTo: self.playButton.trailingAnchor, constant: 20),
            self.downloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70),
            self.downloadButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            self.downloadButton.widthAnchor.constraint(equalToConstant: 120),
            
        ]
        
        
        NSLayoutConstraint.activate(playButtonConstraint)
        NSLayoutConstraint.activate(downloadButtonConstraint)
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor]
        gradientLayer.frame = self.bounds
        
        self.layer.addSublayer(gradientLayer)
    }
}
