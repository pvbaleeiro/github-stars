//
//  UIButton+Util.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 17/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation
import UIKit


extension UIButton {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Style
    //-------------------------------------------------------------------------------------------------------------
    func defaultStyle() {
        
        //
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 2
        layer.borderWidth = 1
        titleLabel?.font = UIFont.sanFranciscoBold(size: 12)
        setTitleColor(UIColor.white, for: UIControlState.normal)
        contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        
        //HIGHLIGHTED
        addTarget(self, action: #selector(changeBackgroundColor(_ :)), for: .touchDown)
        addTarget(self, action: #selector(resetBackgroundColor(_ :)), for: .touchUpInside)
        addTarget(self, action: #selector(resetBackgroundColor(_ :)), for: .touchUpOutside)
        addTarget(self, action: #selector(resetBackgroundColor(_ :)), for: .touchCancel)
    }
    
    func statusStyle(statusClosed: Bool) {
        
        if (statusClosed) {
            setTitle("fechado", for: .normal)
            setTitleColor(UIColor.tomato(), for: .normal)
            layer.borderColor = UIColor.tomato().cgColor
            
        } else {
            setTitle("aberto", for: .normal)
            setTitleColor(UIColor.azure(), for: .normal)
            layer.borderColor = UIColor.azure().cgColor
        }
        
        isUserInteractionEnabled = false
        titleLabel?.font = UIFont.sanFranciscoBold(size: 12)
        backgroundColor = .clear
        layer.cornerRadius = 2
        layer.borderWidth = 1
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Auxiliares
    //-------------------------------------------------------------------------------------------------------------
    @objc func changeBackgroundColor(_ sender:UIButton) {
        backgroundColor = UIColor.grayDisable()
    }
    @objc func resetBackgroundColor(_ sender:UIButton) {
        backgroundColor = UIColor.lightGray
    }
}
