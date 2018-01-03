//
//  RepositoryListContract.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 03/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation

// MARK: - View
protocol RepositoryListViewProtocol: class {
    
    var presenter: RepositoryListPresenterProtocol! { get set } 
}

// MARK: - Presenter
protocol RepositoryListPresenterProtocol: class {
    
    weak var view: RepositoryListViewProtocol! { get set }
    var router: RepositoryListRouterProtocol! { get set }
    var interactor: RepositoryListInteractorProtocol! { get set }
    
    func loadRepositories() -> [Repository]
}

// MARK: - Router
protocol RepositoryListRouterProtocol: class {
    
}

// MARK: - Interactor
protocol RepositoryListInteractorProtocol: class {
    
}
