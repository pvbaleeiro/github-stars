//
//  BaseTableView+CommomnViewProtocol.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 04/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import UIKit

extension BaseTableView: CommonViewProtocol {
    
    func showSppinerHeader() {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: 0, y: 0, width: frame.width, height: 44)
        tableHeaderView = spinner
    }
    
    func showSppinerFooter() {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.startAnimating()
        spinner.frame = CGRect(x: 0, y: 0, width: frame.width, height: 44)
        tableFooterView = spinner
    }
    
    func removeAllSppiners() {
        tableHeaderView = nil
        tableFooterView = nil
    }
}
