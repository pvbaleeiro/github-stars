//
//  ShadowView.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 20/11/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpShadow()
    }
    
    func setUpShadow() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0.9, height: 9.5) //11
        self.layer.shadowRadius = 10 //18
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        self.backgroundColor = .white
    }    
}
