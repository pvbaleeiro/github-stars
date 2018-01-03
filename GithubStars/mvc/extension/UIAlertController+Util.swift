//
//  UIAlertController+Util.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 17/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit


extension UIAlertController {
    
    class func defaultAlertError(onController: UIViewController, message: String, backScreen: Bool) {
        
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            
            NSLog("The \"OK\" alert occured.")
            if (backScreen) {
                onController.navigationController?.popViewController(animated: true)
            }
        }))
        onController.present(alert, animated: true, completion: nil)
    }
}
