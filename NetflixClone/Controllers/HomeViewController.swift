//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 4/9/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeFeedTable: UITableView = {
        let feedTable = UITableView(frame: .zero, style: .grouped)
        
        feedTable.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        
        return feedTable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.setupView()
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.homeFeedTable.frame = self.view.bounds
    }
    

    private func setupView() {
        
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
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else { return UITableViewCell()
        }
        
        return cell
    }
}
