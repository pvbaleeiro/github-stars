//
//  BaseViewController.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {

    // MARK: Properties
    //Views
    @IBOutlet weak var viewEmptyInfo: UIView!
    @IBOutlet weak var lblEmptyInfo: UILabel!
    @IBOutlet weak var btnEmptyAction: UIButton!
    //Callback para erro no modo peak
    var showAlertErrorCallback: ((_ error: String) -> Void)? = nil

    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: Setup
    func setupLayout() {
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func setupData() {
        
    }
    
    func setupText() {
        
    }
    
    
    // MARK: Aux
    func setNavBarWithTitle(title: String) {
        
        //Bug ???
//        self.navigationController?.navigationBar.isHidden = true
//        self.navigationController?.navigationBar.isHidden = false
//        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        
        self.view.backgroundColor = .myLightGray
        self.navigationController?.navigationBar.barTintColor = .charcoal
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationItem.title = title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
