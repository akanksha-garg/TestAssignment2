//
//  ViewController.swift
//  TestAssignment
//
//  Created by Akanksha garg on 12/07/20.
//  Copyright © 2020 Akanksha garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blogsTableView: UITableView!
    // MARK: - Variables
    let blogVM = BlogViewModel()
    private let control: UIRefreshControl = UIRefreshControl()
    let estimatedRowHeight = 450.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blogsTableView.register(UINib.init(nibName: BlogArticleTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: BlogArticleTableViewCell.identifier)
        blogVM.needsRefresh = { [weak self] in
            DispatchQueue.main.async {
                if let control = self?.blogsTableView.refreshControl, control.isRefreshing {
                    control.endRefreshing()
                }
                self?.blogsTableView.reloadData()
            }
        }
        blogVM.loadData(isPullToRefresh: false)
        control.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        blogsTableView.refreshControl = control
        self.blogsTableView.estimatedRowHeight = CGFloat(estimatedRowHeight)
    }
    
    // MARK: - Pull to refresh Function
    @objc private func reloadData() {
        blogVM.loadData(isPullToRefresh: true)
    }
    
}
