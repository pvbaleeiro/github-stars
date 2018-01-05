//
//  RepositoryDetailRouter.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 05/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import UIKit

class RepositoryDetailRouter: RepositoryDetailRouterProtocol, Storyboarded {
    
    // MARK: Properties
    static let storyboardName = "RepositoryDetail"
    weak var viewController: BaseViewController!
    
    // MARK: Static functions
    static func assembleModule(_ repository: Repository) -> BaseViewController {
        let view = RepositoryDetailRouter.repositoryDetailViewController()
        let presenter = RepositoryDetailPresenter()
        let router = RepositoryDetailRouter()
        let interactor = RepositoryDetailInteractor()
        
        view.presenter = presenter
        router.viewController = view
        interactor.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.repository = repository
        
        return view
    }
    
    static func repositoryDetailViewController() -> RepositoryDetailViewController {
        return storyboard.instantiateViewController()
    }
}
