//
//  UIView+Util.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit

extension UIView {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Estilos
    //-------------------------------------------------------------------------------------------------------------
    func materialStyleCard() {
        layer.cornerRadius = 15.0
//        layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
//        layer.shadowRadius = 2.0
//        layer.shadowColor = UIColor.gray.cgColor
//        layer.shadowOpacity = 0.7
        backgroundColor = UIColor.white
        
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0.9, height: 9.5) //11
        self.layer.shadowRadius = 10 //18
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
    }
    
    func circleStyle() {
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 5.0
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
        clipsToBounds = true
    }
    
    func lineCellStyle() {
        backgroundColor = UIColor.lightGray
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Outros
    //-------------------------------------------------------------------------------------------------------------
    func animateClick(color: UIColor? = nil) {
        
        let currentBackColor = backgroundColor
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundColor = (color == nil) ? UIColor.grayDisable() : color
            
        }, completion: {
            (value: Bool) in
            self.backgroundColor = currentBackColor
        })
    }
}
