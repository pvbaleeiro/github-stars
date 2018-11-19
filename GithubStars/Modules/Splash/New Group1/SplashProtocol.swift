//
//  SplashProtocol.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 04/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation

// MARK: - View
protocol SplashViewProtocol: class {
    
    var presenter: SplashPresenterProtocol! { get set }
}

// MARK: - Presenter
protocol SplashPresenterProtocol: class {
    
    var router: SplashRouterProtocol! { get set }
    var interactor: SplashInteractorProtocol! { get set }
    
    func viewWillAppear()
}

// MARK: - Router
protocol SplashRouterProtocol: class {
    
    func presentMainViewController()
}

// MARK: - Interactor
protocol SplashInteractorProtocol : class {
    
}
