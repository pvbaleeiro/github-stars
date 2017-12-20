//
//  ControllerExtension.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 17/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//
import UIKit


//-------------------------------------------------------------------------------------------------------------
// MARK: Protocol
//-------------------------------------------------------------------------------------------------------------
protocol UserInfo {
    func loadUserDetails(url: String, usernameLabel: UILabel, nameLabel: UILabel)
}

protocol EmptyView {
    func buildEmptyViewNoConnection() -> EmptyViewModel
    func buildEmptyViewNoData() -> EmptyViewModel
}


//-------------------------------------------------------------------------------------------------------------
// MARK: Extensao
//-------------------------------------------------------------------------------------------------------------
extension UserInfo {
    
    func loadUserDetails(url: String, usernameLabel: UILabel, nameLabel: UILabel) {
        ApiGithub.getUserDetail(url: url) {
            (response) in
            
            switch response {
            case .onSuccess(let user as UserDetail):
                
                //Atribui ao objeto da próxima tela
                print(user)
                
                //Refresh screen
                usernameLabel.text = (user.login != nil && user.login != "") ? user.login : "-"
                nameLabel.text = (user.name != nil && user.name != "") ? user.name : "-"
                break
                
            case .onFailure(let erro):
                print(erro)
                //Referesh screen
                usernameLabel.text = "-"
                nameLabel.text = "-"
                break
                
            case .onNoConnection():
                print("Sem conexão")
                //Referesh screen
                usernameLabel.text = "-"
                nameLabel.text = "-"
                break
                
            default:
                break
            }
        }
    }
}

extension EmptyView {
    
    func buildEmptyViewNoConnection() -> EmptyViewModel {
        return EmptyViewModel.init(buttonTitle: "Recarregar", titleLabel: "Sem conexão com a internet.")
    }
    
    func buildEmptyViewNoData() -> EmptyViewModel {
        return EmptyViewModel.init(buttonTitle: "Recarregar", titleLabel: "Não há dados disponíveis.")
    }
}


//-------------------------------------------------------------------------------------------------------------
// MARK: Classes aplicadas
//-------------------------------------------------------------------------------------------------------------
extension CardCell: UserInfo {}
extension PullRequestsCell: UserInfo {}
extension MainViewController: EmptyView {}
extension PullRequestsViewContoller: EmptyView {}



//-------------------------------------------------------------------------------------------------------------
// MARK: Classe auxiliar
//-------------------------------------------------------------------------------------------------------------
class EmptyViewModel {
    var buttonTitle: String = ""
    var titleLabel: String = ""
    
    @objc public init(buttonTitle: String, titleLabel: String) {
        self.buttonTitle = buttonTitle
        self.titleLabel = titleLabel
    }
}

