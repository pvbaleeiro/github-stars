//
//  RepositoryListContract.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 03/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation

// MARK: - View
protocol RepositoryListViewProtocol: CommonViewProtocol {
    
    var presenter: RepositoryListPresenterProtocol! { get set }
    
    // Presenter -> View
    func showRepositories(with repositories: [Repository])
}

// MARK: - Presenter
protocol RepositoryListPresenterProtocol: class {
    
    weak var view: RepositoryListViewProtocol! { get set }
    var router: RepositoryListRouterProtocol! { get set }
    var interactor: RepositoryListInteractorProtocol! { get set }
    
    func loadRepositories()
    func didSelectRepository(_ repository: Repository)
}

// MARK: - Router
protocol RepositoryListRouterProtocol: class {
    
    weak var viewController: BaseViewController! { get set }
    
    func presentDetails(forRepository repository: Repository)
}

// MARK: - Interactor
protocol RepositoryListInteractorProtocol: class {
    weak var output: RepositoryListInteractorOutputProtocol! { get set }

    func fetchRepositories()
}

protocol RepositoryListInteractorOutputProtocol: class {
    func repositoriesFetched(_ repositories: RepositoryList)
    func repositoriesFetchFailed()
}
