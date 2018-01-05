//
//  RepositoryListViewController.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 03/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import UIKit

class RepositoryListViewController: BaseViewController {
    
    // MARK: Properties
    @IBOutlet fileprivate weak var tbvRepositories: BaseTableView!
    var presenter: RepositoryListPresenterProtocol!
    fileprivate var repositoryList: [Repository] = [] {
        didSet {
            tbvRepositories.reloadData()
        }
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup view
        setupLayout()
        setupData()
        setupText()
        
        presenter.loadRepositories()
    }
    
    // MARK: Setup
    override func setupData() {
        //Table view
        tbvRepositories.delegate = self
        tbvRepositories.dataSource = self
    }
}

// MARK: Common protocol
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

// MARK: View protocol
extension RepositoryListViewController: RepositoryListViewProtocol {
    
    func showRepositories(with repositories: [Repository]) {
        self.repositoryList = repositories
    }
}

// MARK: Table Delegate
extension RepositoryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return repositoryList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Build cell
        let cell : CardCell = tableView.dequeueReusableCell(withIdentifier: CardCell.cellIdentifier())! as! CardCell
        let repository: Repository = repositoryList[indexPath.section]
        
        cell.configWithRepository(repo: repository)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("==== Ir para pull requests ====")

        //Animate click
        let cell : CardCell = tableView.cellForRow(at: indexPath) as! CardCell
        cell.viewCard.animateClick()
        
        //Go to next
        let repository = repositoryList[indexPath.section]
        presenter.didSelectRepository(repository)
    }
}
