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
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        return view
    }
    
    static func repositoryListViewController() -> RepositoryListViewController {
        return storyboard.instantiateViewController()
    }
    
//    func closeFaq() {
//        viewController.dismiss(animated: true, completion: nil)
//    }
//    
//    func presentViewPlayer(link: String) {
//        let playerController = YoutubePlayerRouter.assembleModule(link: link)
//        viewController.navigationController?.pushViewController(playerController, animated: true)
//    }
}
