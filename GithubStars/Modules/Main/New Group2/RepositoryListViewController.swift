//
//  RepositoryListViewController.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 03/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import UIKit

class RepositoryListViewController: BaseViewController, RepositoryListViewProtocol {

    // MARK: Properties
    @IBOutlet fileprivate weak var tbvRepositories: BaseTableView!
    var presenter: RepositoryListPresenterProtocol!
    fileprivate var repositoryList: [Repository] = []


    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup view
        setupLayout()
        setupData()
        setupText()
        
        repositoryList = presenter.loadRepositories()
    }
}

extension RepositoryListViewController: CommonViewProtocol {
    
    func showSppinerHeader() {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: 0, y: 0, width: tbvRepositories.frame.width, height: 44)
        tbvRepositories.tableHeaderView = spinner
    }
    
    func showSppinerFooter() {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: 0, y: 0, width: tbvRepositories.frame.width, height: 44)
        tbvRepositories.tableFooterView = spinner
    }
    
    func removeAllSppiners() {
        tbvRepositories.tableHeaderView = nil
        tbvRepositories.tableFooterView = nil
    }
}
