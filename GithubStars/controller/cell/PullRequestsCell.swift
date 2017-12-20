//
//  PullRequestsCell.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 17/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit

class PullRequestsCell: BaseTableViewCell {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblCreatedAt: UILabel!
    @IBOutlet weak var lblUpdatedAt: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var viewLine: UIView!
    @IBOutlet weak var btnStatusPull: UIButton!

    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Ciclo de vida
    //-------------------------------------------------------------------------------------------------------------
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    //MARK: Setup
    //-------------------------------------------------------------------------------------------------------------
    override func setupLayout() {
        super.setupLayout()
        
        //Label
        lblTitle.titleStyle()
        lblDescription.descriptionStyle()
        lblUsername.usernameStyle()
        lblFullName.fullnameStyle()
        lblCreatedAt.fullnameStyle()
        lblUpdatedAt.fullnameStyle()
        //Image
        imgAvatar.circleStyle()
        //View
        viewLine.lineCellStyle()
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    //MARK: Config
    //-------------------------------------------------------------------------------------------------------------
    func configWithPullReques(pull: PullRequest) {
        //Fill
        lblTitle.text = pull.title
        lblDescription.text = pull.body
        lblCreatedAt.text = "Criado em: " + Date.friendlyDate(dateForFormat: pull.createdAt!)
        
        //Status
        var title: String = ""
        if (pull.state == "open") {
            title = "Atualizado em: "
            btnStatusPull.statusStyle(statusClosed: false)
            
        } else {
            title = "Fechado em: "
            btnStatusPull.statusStyle(statusClosed: true)
        }
        
        lblUpdatedAt.text = title + Date.friendlyDate(dateForFormat: pull.updatedAt!)
        ApiGithub.getAvatar(url: (pull.user?.avatarUrl)!, onImageView: imgAvatar)

        //Busca detalhes
        loadUserDetails(url: (pull.user?.url)!, usernameLabel: lblUsername, nameLabel: lblFullName)
    }
}


