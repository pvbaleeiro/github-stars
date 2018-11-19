//
//  BaseTableView.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit

//-------------------------------------------------------------------------------------------------------------
// MARK: Delegate refresh control
//-------------------------------------------------------------------------------------------------------------
protocol BaseTableViewRefreshDelegate {
    func refreshed()
}


class BaseTableView: UITableView {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Propriedades
    //-------------------------------------------------------------------------------------------------------------
    var allowRefreshControl: Bool = false {
        didSet {
            
            if (allowRefreshControl) {
                
                //Add refresh control
                self.addSubview(refreshBase)
                self.refreshBase.addTarget(self, action: #selector(updateData(_:)), for: .valueChanged)
            }
        }
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Construtor
    //-------------------------------------------------------------------------------------------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        //
        setupLayout()
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Setup
    //-------------------------------------------------------------------------------------------------------------
    func setupLayout() {
        //Tb view
        backgroundColor = UIColor.clear
        separatorStyle = .none
        allowRefreshControl = false
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Propriedades
    //-------------------------------------------------------------------------------------------------------------
    lazy var refreshBase: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .charcoal
        return refreshControl
    }()
    var refreshDelegate: BaseTableViewRefreshDelegate?
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Action
    //-------------------------------------------------------------------------------------------------------------
    @objc func updateData(_ sender: UIRefreshControl) {
        refreshDelegate?.refreshed()
    }
    
//    func showSppinerHeader() {
//        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
//        spinner.startAnimating()
//        spinner.frame = CGRect(x: 0, y: 0, width: frame.width, height: 44)
//        tableHeaderView = spinner
//    }
//    
//    func showSppinerFooter() {
//        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
//        spinner.startAnimating()
//        spinner.frame = CGRect(x: 0, y: 0, width: frame.width, height: 44)
//        tableFooterView = spinner
//    }
//    
//    func removeAllSppiners() {
//        tableHeaderView = nil
//        tableFooterView = nil
//    }
    
}



