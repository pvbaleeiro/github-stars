//
//  UIWindow+SetRoot.swift
//  NDGApp
//
//  Created by PEREZ AFANADOR Diana Maria on 11/05/2017.
//  Copyright © 2017 Nestec S.A. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {
    
    /// Fix for http://stackoverflow.com/a/27153956/849645
    func set(rootViewController newRootViewController: UIViewController) {
        
        let previousViewController = rootViewController
        
        rootViewController = newRootViewController
        newRootViewController.setNeedsStatusBarAppearanceUpdate()
        
        if let transitionViewClass = NSClassFromString("UITransitionView") {
            for subview in subviews where subview.isKind(of: transitionViewClass) {
                subview.removeFromSuperview()
            }
        }
        
        if let previousViewController = previousViewController {
            previousViewController.dismiss(animated: false) {
                previousViewController.view.removeFromSuperview()
            }
        }
    }
}
