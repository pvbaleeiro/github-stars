//
//  RepositoryListRouter.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 03/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation
import UIKit

class RepositoryListRouter: RepositoryListRouterProtocol, Storyboarded {
    
    // MARK: Properties
    static let storyboardName = "RepositoryList"
    weak var viewController: BaseViewController!
    
    // MARK: Static functions
    static func assembleModule() -> BaseViewController {
        let view = RepositoryListRouter.repositoryListViewController()
        let presenter = RepositoryListPresenter()
        let router = RepositoryListRouter()
        let interactor = RepositoryListInteractor()
        
        view.presenter = presenter
        router.viewController = view
        interactor.output = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        return view
    }
    
    static func repositoryListViewController() -> RepositoryListViewController {
        return storyboard.instantiateViewController()
    }
    
    func presentDetails(forRepository repository: Repository) {
        let detailModuleViewController = RepositoryDetailRouter.assembleModule(repository)
        detailModuleViewController.setNavBarWithTitle(title: "\(repository.fullName ?? "Repositório") - PR")
        
        viewController.navigationController?.setNavigationBarHidden(false, animated: false)
        viewController.navigationController?.pushViewController(detailModuleViewController, animated: true)
    }
}
