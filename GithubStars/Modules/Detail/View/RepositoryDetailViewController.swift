//
//  RepositoryDetailViewController.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 05/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: BaseViewController {

    // MARK: Properties
    @IBOutlet fileprivate weak var tbvPullRequests: BaseTableView!
    @IBOutlet fileprivate weak var viewHeader: UIView!
    @IBOutlet fileprivate weak var lblTotal: UILabel!
    var presenter: RepositoryDetailPresenterProtocol!
    fileprivate var pullRequestsList: [PullRequest] = [] {
        didSet {
            tbvPullRequests.reloadData()
        }
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup view
        setupLayout()
        setupData()
        setupText()
        
        presenter.loadPullRequests()
    }
    
    // MARK: Setup
    override func setupLayout() {
        super.setupLayout()
        
        //Empty view
        lblEmptyInfo.titleInfo()
        btnEmptyAction.defaultStyle()
    }
    
    override func setupData() {
        //Table view
        tbvPullRequests.delegate = self
        tbvPullRequests.dataSource = self
    }
}

// MARK: Common protocol
extension RepositoryDetailViewController: CommonViewProtocol {
    
    func showSppinerHeader() {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: 0, y: 0, width: tbvPullRequests.frame.width, height: 44)
        tbvPullRequests.tableHeaderView = spinner
    }
    
    func showSppinerFooter() {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: 0, y: 0, width: tbvPullRequests.frame.width, height: 44)
        tbvPullRequests.tableFooterView = spinner
    }
    
    func removeAllSppiners() {
        tbvPullRequests.tableHeaderView = nil
        tbvPullRequests.tableFooterView = nil
    }
}

// MARK: View protocol
extension RepositoryDetailViewController: RepositoryDetailViewProtocol {
    
    func showPullRequests(with pullRequests: [PullRequest]) {
        self.pullRequestsList = pullRequests
    }
}

// MARK: Table delegate
extension RepositoryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequestsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Build cell
        let cell : PullRequestsCell = tableView.dequeueReusableCell(withIdentifier: PullRequestsCell.cellIdentifier())! as! PullRequestsCell
        
        let pull: PullRequest = pullRequestsList[indexPath.row]
        cell.configWithPullReques(pull: pull)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Animate click
        let cell : PullRequestsCell = tableView.cellForRow(at: indexPath) as! PullRequestsCell
        cell.animateClick(color: UIColor.darkGray)
        
        print("==== Ir para pull requests ====")
        let pull: PullRequest = pullRequestsList[indexPath.row]
        UIApplication.shared.openURL(URL(string:pull.htmlUrl!)!)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //Verifica abertos e fechados
        if (pullRequestsList.count > 0) {
            var open: Int = 0
            var closed: Int = 0
            //Varre a lista
            for pull in pullRequestsList {
                if (pull.state == "open") {
                    open += 1
                } else {
                    
                    closed += 1
                }
            }
            
            lblTotal.text = "Abertos: \(open) | Fechados: \(closed)"
            lblTotal.usernameStyle()
            viewHeader.materialStyleCard()
        }
        
        return viewHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (pullRequestsList.count > 0) ? 44 : 0
    }
}

