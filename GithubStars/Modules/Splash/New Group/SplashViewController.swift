//
//  SplashViewController.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 04/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation
import UIKit

class SplashViewController: BaseViewController {
    
    // MARK: Properties
    var presenter: SplashPresenterProtocol!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let deadlineTime = DispatchTime.now() + 1.0
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            self.presenter.viewWillAppear()
        }
    }
}
