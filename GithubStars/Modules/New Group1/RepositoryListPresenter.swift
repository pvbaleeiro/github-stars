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
    
    func loadRepositories() -> [Repository] {
        return interactor.fetchRepositories()
    }
}

