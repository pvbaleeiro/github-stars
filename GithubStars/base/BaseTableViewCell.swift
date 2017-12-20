//
//  BaseTableViewCell.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit


class BaseTableViewCell: UITableViewCell {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Construtor
    //-------------------------------------------------------------------------------------------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        //Layout
        setupLayout()
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    //MARK: Setup
    //-------------------------------------------------------------------------------------------------------------
    func setupLayout() {
        //View
        backgroundColor = UIColor.clear
    }
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Auxiliares
    //-------------------------------------------------------------------------------------------------------------
    class func cellIdentifier() -> String {
        let delimitador = "."
        let nomeBruto = NSStringFromClass(self)
        let nomePuro = nomeBruto.components(separatedBy: delimitador)
        return nomePuro[1]
    }
}
