//
//  RepositoryDetailPresenter.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 05/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation

class RepositoryDetailPresenter: RepositoryDetailPresenterProtocol {
    
    // MARK: Properties
    weak var view: RepositoryDetailViewProtocol!
    var router: RepositoryDetailRouterProtocol!
    var interactor: RepositoryDetailInteractorProtocol!
    var repository: Repository!
    
    func loadPullRequests() {
        view.showSppinerFooter()
        interactor.fetchPullRequests(url: repository.pullsUrl!)
    }
}

extension RepositoryDetailPresenter: RepositoryDetailInteractorOutputProtocol {
    
    func pullRequestsFetched(_ pullRequests: [PullRequest]) {
        view.showPullRequests(with: pullRequests)
        view.removeAllSppiners()
    }
    
    func pullRequestsFetchFailed() {
        
    }
}
