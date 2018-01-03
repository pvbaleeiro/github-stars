//
//  UIFont+Util.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit

extension UIFont {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Fontes padrão
    //-------------------------------------------------------------------------------------------------------------
    class func sanFranciscoUltraLight(size: CGFloat) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .ultraLight)
        } else {
            // Fallback on earlier versions
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    class func sanFranciscoThin(size: CGFloat) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .thin)
        } else {
            // Fallback on earlier versions
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    class func sanFranciscoLight(size: CGFloat) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .light)
        } else {
            // Fallback on earlier versions
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    class func sanFranciscoRegular(size: CGFloat) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .regular)
        } else {
            // Fallback on earlier versions
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    class func sanFranciscoMedium(size: CGFloat) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .medium)
        } else {
            // Fallback on earlier versions
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    class func sanFranciscoSemiBold(size: CGFloat) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .semibold)
        } else {
            // Fallback on earlier versions
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    class func sanFranciscoBold(size: CGFloat) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .bold)
        } else {
            // Fallback on earlier versions
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    class func sanFranciscoHeavy(size: CGFloat) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .heavy)
        } else {
            // Fallback on earlier versions
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    class func sanFranciscoBlack(size: CGFloat) -> UIFont {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .black)
        } else {
            // Fallback on earlier versions
            return UIFont.systemFont(ofSize: size)
        }
    }
}

