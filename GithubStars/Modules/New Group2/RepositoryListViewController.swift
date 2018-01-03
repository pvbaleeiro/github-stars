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
        
        repositoryList = presenter.loadRepositories()
    }
}
