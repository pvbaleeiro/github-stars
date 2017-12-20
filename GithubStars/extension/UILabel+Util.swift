//
//  UILabel+Util.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit


//-------------------------------------------------------------------------------------------------------------
// MARK: CONSTANTES
//-------------------------------------------------------------------------------------------------------------
enum FontSize: CGFloat {
    case title = 20
    case description = 18
    case username = 13
    case minimum = 10
}

extension UILabel {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Estilos
    //-------------------------------------------------------------------------------------------------------------
    func titleStyle() {
        font = UIFont.sanFranciscoBold(size: FontSize.title.rawValue)
        textColor = UIColor.charcoal()
        textAlignment = .left
    }
    
    func descriptionStyle() {
        font = UIFont.sanFranciscoRegular(size: FontSize.description.rawValue)
        textColor = UIColor.charcoal()
        textAlignment = .left
    }
    
    func usernameStyle() {
        font = UIFont.sanFranciscoMedium(size: FontSize.username.rawValue)
        textColor = UIColor.charcoal()
        adjustsFontSizeToFitWidth = true
        textAlignment = .center
    }
    
    func fullnameStyle() {
        font = UIFont.sanFranciscoRegular(size: FontSize.username.rawValue)
        textColor = UIColor.greyish()
        adjustsFontSizeToFitWidth = true
        textAlignment = .center
    }
    
    func forkStyle() {
        font = UIFont.sanFranciscoBold(size: FontSize.username.rawValue)
        textColor = UIColor.charcoal()
        textAlignment = .left
    }
    
    func titleInfo() {
        font = UIFont.sanFranciscoRegular(size: FontSize.title.rawValue)
        textColor = UIColor.greyish()
        adjustsFontSizeToFitWidth = true
        textAlignment = .center
    }
}

