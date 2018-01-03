//
//  CardCell.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit

class CardCell: BaseTableViewCell {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblFork: UILabel!
    @IBOutlet weak var lblStar: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var imgFork: UIImageView!
    @IBOutlet weak var imgStar: UIImageView!

    
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
        
        //Card
        viewCard.materialStyleCard()
        //Label
        lblTitle.titleStyle()
        lblDescription.descriptionStyle()
        lblUsername.usernameStyle()
        lblFullName.fullnameStyle()
        lblFork.forkStyle()
        lblStar.forkStyle()
        //Image
        imgAvatar.circleStyle()
        imgFork.image = UIImage(named: "fork")!
        imgStar.image = UIImage(named: "star")!
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    //MARK: Config
    //-------------------------------------------------------------------------------------------------------------
    func configWithRepository(repo: Repository) {
        //Fill
        lblTitle.text = repo.fullName
        lblDescription.text = repo.description
        lblFork.text = FormatUtil.friendlyFormatValuePoint(from: repo.forks!)
        lblStar.text = FormatUtil.friendlyFormatValuePoint(from: repo.stargazersCount!)
        ApiGithub.getAvatar(url: (repo.owner?.avatarUrl)!, onImageView: imgAvatar)
        
        //Busca detalhes
        loadUserDetails(url: (repo.owner?.url)!, usernameLabel: lblUsername, nameLabel: lblFullName)
    }
}

