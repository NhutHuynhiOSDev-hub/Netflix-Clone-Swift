//
//  UpcomingViewController.swift
//  NetflixClone
//
//  Created by Nhut Huynh Quang on 4/9/25.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    private let upcomingTableView: UITableView = {
        let upcomingTableView = UITableView()
        
        upcomingTableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: UpcomingTableViewCell.identifier)
    
        return upcomingTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.upcomingTableView.frame = self.view.bounds
    }
    
    private func setupView() {
        
        self.view.backgroundColor = .systemBackground
        
        self.title = "Upcoming"
        self.navigationController?.navigationBar.prefersLargeTitles     = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        self.upcomingTableView.delegate   = self
        self.upcomingTableView.dataSource = self
        self.view.addSubview(self.upcomingTableView)
    }
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let upcomingTableCell = tableView.dequeueReusableCell(withIdentifier: UpcomingTableViewCell.identifier, for: indexPath) as? UpcomingTableViewCell else {
            return UITableViewCell()
        }
        
        return upcomingTableCell
    }
}
