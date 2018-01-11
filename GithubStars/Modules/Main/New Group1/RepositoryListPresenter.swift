//
//  RepositoryListPresenter.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 03/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation

class RepositoryListPresenter: RepositoryListPresenterProtocol {
    
    // MARK: Properties
    weak var view: RepositoryListViewProtocol!
    var router: RepositoryListRouterProtocol!
    var interactor: RepositoryListInteractorProtocol!
    
    func loadRepositories() {
        view.showSppinerFooter()
        interactor.fetchRepositories()
    }
    
    func didSelectRepository(_ repository: Repository) {
        router.presentDetails(forRepository: repository)
    }
}

extension RepositoryListPresenter: RepositoryListInteractorOutputProtocol {
    func repositoriesFetched(_ repositories: RepositoryList) {
        view.showRepositories(with: repositories.items!)
        view.removeAllSppiners()
    }
    
    func repositoriesFetchFailed() {
        view.removeAllSppiners()
        view.showAlertError()
    }
    
    func notConnectedToInternet() {
        view.removeAllSppiners()
        view.showAlertError()
    }
}


