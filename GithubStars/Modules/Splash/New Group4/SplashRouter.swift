//
//  SplashRouter.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 04/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation
import UIKit

final class SplashRouter: Storyboarded {
    
    // MARK: Properties
    static let storyboardName = "Splash"
    
    static func assembleModule() -> UIViewController {
        
        let router = SplashRouter()
        let view = splashView()
        let presenter = SplashPresenter()
        let interactor = SplashInteractor()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
    
    static func splashView() -> SplashViewController {
        return storyboard.instantiateViewController()
    }
}

extension SplashRouter: SplashRouterProtocol {
    
    func presentMainViewController() {
        
        let repositoryView = RepositoryListRouter.assembleModule()
        
        let navigationController = UINavigationController(rootViewController: repositoryView)
        navigationController.setNavigationBarHidden(false, animated: false)
        repositoryView.setNavBarWithTitle(title: "Github Java Stars")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.switchMainViewController(viewController: navigationController)
    }
}
