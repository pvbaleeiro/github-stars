//
//  BaseViewController.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {

    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    //Views
    @IBOutlet weak var viewEmptyInfo: UIView!
    @IBOutlet weak var lblEmptyInfo: UILabel!
    @IBOutlet weak var btnEmptyAction: UIButton!
    //Callback para erro no modo peak
    var showAlertErrorCallback: ((_ error: String) -> Void)? = nil

    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Lifecycle
    //-------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Setup
    //-------------------------------------------------------------------------------------------------------------
    func setupLayout() {

    }
    
    func setupData() {
        
    }
    
    func setupText() {
        
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Aux
    //-------------------------------------------------------------------------------------------------------------
    func setNavBarWithTitle(title: String) {
        
        //Bug ???
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        
        //Nav bar
        view.backgroundColor = UIColor.myLightGray()
        navigationController?.navigationBar.barTintColor = UIColor.charcoal()
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.title = title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
