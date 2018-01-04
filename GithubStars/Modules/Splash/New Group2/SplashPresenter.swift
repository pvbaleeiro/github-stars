//
//  SplashPresenter.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 04/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation

class SplashPresenter: SplashPresenterProtocol {

    // MARK: Properties
    var router: SplashRouterProtocol!
    var interactor: SplashInteractorProtocol!
    
    func viewWillAppear() {
        self.router.presentMainViewController()
    }
}
