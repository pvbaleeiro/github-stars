//
//  RepositoryDetailContract.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 05/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation

// MARK: - View
protocol RepositoryDetailViewProtocol: CommonViewProtocol {
    
    var presenter: RepositoryDetailPresenterProtocol! { get set }
    
    // Presenter -> View
    func showPullRequests(with pullRequests: [PullRequest])
}

// MARK: - Presenter
protocol RepositoryDetailPresenterProtocol: class {
    
    weak var view: RepositoryDetailViewProtocol! { get set }
    var router: RepositoryDetailRouterProtocol! { get set }
    var interactor: RepositoryDetailInteractorProtocol! { get set }
    
    func loadPullRequests()
    //func didSelectRepository(_ repository: Repository)
}

// MARK: - Router
protocol RepositoryDetailRouterProtocol: class {
    
    weak var viewController: BaseViewController! { get set }
}

// MARK: - Interactor
protocol RepositoryDetailInteractorProtocol: class {
    weak var output: RepositoryDetailInteractorOutputProtocol! { get set }
    
    func fetchPullRequests(url: String)
}

protocol RepositoryDetailInteractorOutputProtocol: class {
    func pullRequestsFetched(_ pullRequests: [PullRequest])
    func pullRequestsFetchFailed()
}
