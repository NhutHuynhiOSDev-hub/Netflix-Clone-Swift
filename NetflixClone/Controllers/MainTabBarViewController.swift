//
//  MainTabBarViewController.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 4/9/25.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    private func setupView() {
        
        let homeNavigationController     = UINavigationController(rootViewController: HomeViewController())
        let searchNavigationController   = UINavigationController(rootViewController: SearchViewController())
        let upcomingNavigationController = UINavigationController(rootViewController: UpcomingViewController())
        let downloadNavigationController = UINavigationController(rootViewController: DownloadViewController())
        
        homeNavigationController.tabBarItem.image       = UIImage(systemName: "house")
        upcomingNavigationController.tabBarItem.image   = UIImage(systemName: "play.circle")
        searchNavigationController.tabBarItem.image     = UIImage(systemName: "magnifyingglass")
        downloadNavigationController.tabBarItem.image   = UIImage(systemName: "arrow.down.to.line")
        
        homeNavigationController.title = "Home"
        upcomingNavigationController.title = "Upcoming"
        searchNavigationController.title = "Search"
        downloadNavigationController.title = "Dowloads"
        
        self.tabBar.tintColor = .label
        
        self.setViewControllers([
            homeNavigationController,
            upcomingNavigationController,
            searchNavigationController,
            downloadNavigationController
        ], animated: true)
    }
}

