//
//  PullRequestsViewContoller.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 17/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit


//-------------------------------------------------------------------------------------------------------------
// MARK: Enums
//-------------------------------------------------------------------------------------------------------------
private enum Texts: String {
    case noData = "Não há pull requests para este repositório."
}


class PullRequestsViewContoller: BaseViewController, UIScrollViewDelegate {

    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    //Views
    @IBOutlet weak var tbvPullRequests: BaseTableView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var lblTotal: UILabel!

    //Controls, Aux
    var repository: Repository = Repository()
    var loadingData: Bool = false
    var isPeekingMode: Bool = false
    var messageErrorPeakMode: String = ""
    var pullsRequests: Array<PullRequest> = Array()
    var currentIndexPath: IndexPath!
    var titleCurrentCell: String = ""
    var rotate: Bool = false
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Lifecycle
    //-------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupLayout()
        setupData()
        setupText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
            if (messageErrorPeakMode != "") {
                showAlertErrorCallback!(messageErrorPeakMode)
            }
    }
    
    //Retain same position in UITableView on screen rotation
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        print("will transition")
        
        self.rotate = true
        coordinator.animate(alongsideTransition: { _ in
            print("animation")
            //Animação
            self.tbvPullRequests.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
            
        }, completion: { _ in
            // Scroll to the saved position prior to screen rotate
            print("rotation")
            UIView.animate(withDuration: 0.5, animations: {
                self.tbvPullRequests.transform = CGAffineTransform.identity
            })
            
            guard let indexPath = self.currentIndexPath else { return }
            self.rotate = false
            self.tbvPullRequests.scrollToRow(at: indexPath, at: .top, animated: false)
        })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //Lógica para conversar com cellforrow para obter o indexpath correto
        if (!rotate) {
            let visibleRect = CGRect(origin: tbvPullRequests.contentOffset, size: tbvPullRequests.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            self.currentIndexPath = tbvPullRequests.indexPathForRow(at: visiblePoint)
            guard let indexPath = self.currentIndexPath else { return }
            if (self.pullsRequests.count > indexPath.section) {
                let pull = self.pullsRequests[self.currentIndexPath.row]
                titleCurrentCell = pull.title!
                print("pull name: " + pull.title!)
            }
        }
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Setup
    //-------------------------------------------------------------------------------------------------------------
    override func setupLayout() {
        super.setupLayout()
        
        //Empty view
        lblEmptyInfo.titleInfo()
        btnEmptyAction.defaultStyle()
    }
    
    override func setupData() {
        //Table view
        tbvPullRequests.delegate = self
        tbvPullRequests.dataSource = self
        
        //First load
        tbvPullRequests.showSppinerHeader()
        loadPullRequests()
    }
    
    override func setupText() {
        
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Service
    //-------------------------------------------------------------------------------------------------------------
    func loadPullRequests() {

        loadingData = true
        ApiGithub.getUserPullRequests(url: repository.pullsUrl!) {
            (response) in

            switch response {
            case .onSuccess(let pullRequests as Array<PullRequest>):
                print(pullRequests)

                //Refresh properties
                self.loadingData = false
                self.pullsRequests = pullRequests
                //Referesh screen
                self.tbvPullRequests.removeAllSppiners()
                if (pullRequests.count > 0) {
                    
                    //Ordena pela data de criação do repositório
                    self.pullsRequests = self.pullsRequests.sorted(by: {
                        if ($0.createdAt != nil && ($1.createdAt != nil)) {
                            return $0.createdAt! > $1.createdAt!
                        }
                        return false
                    })
                    self.tbvPullRequests.reloadData()
                    
                } else {
                    let empty: EmptyViewModel = self.buildEmptyViewNoData()
                    empty.titleLabel = Texts.noData.rawValue
                    self.updateScreenWithEmptyView(empty: empty)
                }
                break

            case .onFailure(let erro as APIResponse):
                print(erro)
                //Refresh properties
                self.loadingData = false
                //Referesh screen
                self.tbvPullRequests.removeAllSppiners()
                
                //Show alert rate limit
                if (erro.httpCode == HttpCodeResponse.rateLimitExceeded.rawValue) {
                    
                    //Em pekking mode, ocorre um crash ao exibir o alerta
                    if (!self.isPeekingMode) {
                        UIAlertController.defaultAlertError(onController: self, message: erro.friendlyMessage, backScreen: true)

                    } else {
                        self.messageErrorPeakMode = erro.friendlyMessage
                        self.navigationController?.popViewController(animated: true)
                    }
                    
                } else {
                    let empty: EmptyViewModel = self.buildEmptyViewNoData()
                    self.updateScreenWithEmptyView(empty: empty)
                }
                break

            case .onNoConnection():
                print("Sem conexão")
                
                let empty: EmptyViewModel = self.buildEmptyViewNoConnection()
                self.updateScreenWithEmptyView(empty: empty)
                
                //Refresh properties
                self.loadingData = false
                //Referesh screen
                self.tbvPullRequests.removeAllSppiners()
                break

            default:
                break
            }
        }
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Actions
    //-------------------------------------------------------------------------------------------------------------
    func updateScreenWithEmptyView(empty: EmptyViewModel) {
        lblEmptyInfo.text = empty.titleLabel
        btnEmptyAction.setTitle(empty.buttonTitle, for: .normal)
        tbvPullRequests.backgroundView = viewEmptyInfo
        btnEmptyAction.addTarget(self, action: #selector(PullRequestsViewContoller.loadDataAndRemoveEmpty), for: .touchUpInside)
    }
    
    @objc func loadDataAndRemoveEmpty() {
        tbvPullRequests.backgroundView = nil
        tbvPullRequests.showSppinerHeader()
        loadPullRequests()
    }
}


//-------------------------------------------------------------------------------------------------------------
// MARK: Delgate and DataSource TbView
//-------------------------------------------------------------------------------------------------------------
extension PullRequestsViewContoller: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullsRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Build cell
        let cell : PullRequestsCell = tableView.dequeueReusableCell(withIdentifier: PullRequestsCell.cellIdentifier())! as! PullRequestsCell
        
        let pull: PullRequest = pullsRequests[indexPath.row]
        
        //Obtem indice para utilizar ao rotacionar
        if (pull.title == titleCurrentCell && rotate) {
            currentIndexPath = indexPath
        }
        cell.configWithPullReques(pull: pull)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Animate click
        let cell : PullRequestsCell = tableView.cellForRow(at: indexPath) as! PullRequestsCell
        cell.animateClick(color: UIColor.darkGray)
        
        print("==== Ir para pull requests ====")
        let pull: PullRequest = pullsRequests[indexPath.row]
        UIApplication.shared.openURL(URL(string:pull.htmlUrl!)!)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //Verifica abertos e fechados
        if (!loadingData && pullsRequests.count > 0) {
            var open: Int = 0
            var closed: Int = 0
            //Varre a lista
            for pull in pullsRequests {
                if (pull.state == "open") {
                    open += 1
                } else {
                    
                    closed += 1
                }
            }
            
            lblTotal.text = "Abertos: \(open) | Fechados: \(closed)"
            lblTotal.usernameStyle()
            viewHeader.materialStyleCard()
        }
        
        return viewHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (!loadingData && pullsRequests.count > 0) ? 44 : 0
    }
}
