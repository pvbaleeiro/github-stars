//
//  MainViewController.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit


//-------------------------------------------------------------------------------------------------------------
// MARK: Enums
//-------------------------------------------------------------------------------------------------------------
private enum Texts: String {
    case navBarTitle = "Github Java Stars"
    case erroConexão = "Verifique sua conexão com a internet."
}

private enum Segues: String {
    case pullRequests = "segue_pull_requests"
}

private enum AccessibilityLabel: String {
    case tbvRepositories = "tbvRepositories-MainViewController"
}


class MainViewController: BaseViewController {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    //-------------------------------------------------------------------------------------------------------------
    //Views
    @IBOutlet weak var tbvRepositories: BaseTableView!
    //Controls, Aux
    var loadingData: Bool = false
    var nextPageForLoad = 0
    var repositories: Array<Repository> = Array()
    var currentRepository: Repository = Repository()
    var visibleSections: Array<IndexPath>!
    var currentIndexPath: IndexPath!
    var idItem: Int? = 0
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
        
        //Nav bar
        setNavBarWithTitle(title: Texts.navBarTitle.rawValue)
    }
    
    //Retain same position in UITableView on screen rotation
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        print("will transition")
        
        self.rotate = true
        coordinator.animate(alongsideTransition: { _ in
          
        }, completion: { _ in
            // Scroll to the saved position prior to screen rotate
            print("rotation")
            guard let indexPath = self.currentIndexPath else { return }
            self.rotate = false
            self.tbvRepositories.scrollToRow(at: indexPath, at: .top, animated: false)
        })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //Lógica para conversar com cellforrow para obter o indexpath correto
        if (!rotate) {
            let visibleRect = CGRect(origin: tbvRepositories.contentOffset, size: tbvRepositories.bounds.size)
            let visiblePoint = CGPoint(x: 0, y: visibleRect.minY)
            self.currentIndexPath = tbvRepositories.indexPathForRow(at: visiblePoint)
            guard let indexPath = self.currentIndexPath else { return }
            //Garantia de não acessar index errado
            if (self.repositories.count > indexPath.section) {
                let repo = self.repositories[indexPath.section] as Repository
                idItem = repo.id!
                print("repo id: \(repo.id!)")
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
        tbvRepositories.delegate = self
        tbvRepositories.dataSource = self
        
        //Check Force Touch Capability
        if #available(iOS 9.0, *) {
            guard traitCollection.forceTouchCapability == .available else {
                //First load
                preLoad()
                return
            }
            registerForPreviewing(with: self, sourceView: tbvRepositories)
        }
        
        //First load
        preLoad()
    }
    
    override func setupText() {
        tbvRepositories.accessibilityLabel = AccessibilityLabel.tbvRepositories.rawValue
        tbvRepositories.isAccessibilityElement = true
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Service
    //-------------------------------------------------------------------------------------------------------------
    func preLoad() {
        tbvRepositories.showSppinerHeader()
        loadRepositories()
    }
    
    @objc func loadRepositories() {
        
        loadingData = true
        ApiGithub.getRepositoriesJavaByStars(page: nextPageForLoad) {
            (response) in
            
            switch response {
            case .onSuccess(let repos as RepositoryList):
                print(repos)
                
                //Primeiro carregamento
                if (self.nextPageForLoad == 0 && repos.items?.count == 0) {
                        let empty: EmptyViewModel = self.buildEmptyViewNoData()
                        self.updateScreenWithEmptyView(empty: empty)
                    
                } else {
                    //Refresh properties
                    self.nextPageForLoad += 1
                    self.repositories = self.repositories + repos.items!
                }
                
                self.loadingData = false
                //Referesh screen
                self.tbvRepositories.removeAllSppiners()
                self.tbvRepositories.reloadData()
                break
                
            case .onFailure(let erro):
                print(erro)
                
                //Primeiro carregamento
                if (self.nextPageForLoad == 0) {
                    let empty: EmptyViewModel = self.buildEmptyViewNoData()
                    self.updateScreenWithEmptyView(empty: empty)
                }
                
                //Refresh properties
                self.loadingData = false
                //Referesh screen
                self.tbvRepositories.removeAllSppiners()
                break
                
            case .onNoConnection():
                print("Sem conexão")
                
                //Primeiro carregamento
                if (self.nextPageForLoad == 0) {
                    let empty: EmptyViewModel = self.buildEmptyViewNoConnection()
                    self.updateScreenWithEmptyView(empty: empty)
                }
                
                //Refresh properties
                self.loadingData = false
                //Referesh screen
                self.tbvRepositories.removeAllSppiners()
                break
                
            default:
                break
            }
        }
    }
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Actions
    //-------------------------------------------------------------------------------------------------------------
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Verifica segues
        if (segue.identifier == Segues.pullRequests.rawValue) {
            
            //Envia objeto para a outra tela
            let pullRequestsController: PullRequestsViewContoller = segue.destination as! PullRequestsViewContoller
            pullRequestsController.repository = currentRepository
            pullRequestsController.setNavBarWithTitle(title: "\(currentRepository.fullName ?? "Repositório") - PR")
        }
    }
    
    func updateScreenWithEmptyView(empty: EmptyViewModel) {
        lblEmptyInfo.text = empty.titleLabel
        btnEmptyAction.setTitle(empty.buttonTitle, for: .normal)
        tbvRepositories.backgroundView = viewEmptyInfo
        btnEmptyAction.addTarget(self, action: #selector(MainViewController.loadDataAndRemoveEmpty), for: .touchUpInside)
    }
    
    @objc func loadDataAndRemoveEmpty() {
        tbvRepositories.backgroundView = nil
        tbvRepositories.showSppinerHeader()
        loadRepositories()
    }
}


//-------------------------------------------------------------------------------------------------------------
// MARK: Delegate and DataSource TbView
//-------------------------------------------------------------------------------------------------------------
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Build cell
        let cell : CardCell = tableView.dequeueReusableCell(withIdentifier: CardCell.cellIdentifier())! as! CardCell
        
        let repository: Repository = repositories[indexPath.section]
        
        //Obtem indice para utilizar ao rotacionar
        if (repository.id == idItem && rotate) {
            currentIndexPath = indexPath
        }
        cell.configWithRepository(repo: repository)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // At the bottom...
        if (indexPath.section == self.repositories.count - 1 && !loadingData && !rotate) {
            print("==== Carregar mais itens... ====")
            
            //Show sppiner and load Data
            tbvRepositories.showSppinerFooter()
            loadRepositories()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("==== Ir para pull requests ====")
        
        //Animate click
        let cell : CardCell = tableView.cellForRow(at: indexPath) as! CardCell
        cell.viewCard.animateClick()
        //Go to next
        currentRepository = repositories[indexPath.section]
        performSegue(withIdentifier: Segues.pullRequests.rawValue, sender: nil)
    }
}


//-------------------------------------------------------------------------------------------------------------
// MARK: UIViewControllerPreviewingDelegate
//-------------------------------------------------------------------------------------------------------------
extension MainViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        // Obtain the index path and the cell that was pressed.
        guard let indexPath = tbvRepositories.indexPathForRow(at: location), let cell = tbvRepositories.cellForRow(at: indexPath) else { return nil }
        
        // Create a destination view controller and set its properties.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "PullRequestsViewContoller") as? PullRequestsViewContoller else { return nil }
        currentRepository = repositories[indexPath.section]
        destinationViewController.repository = currentRepository
        destinationViewController.isPeekingMode = true
        destinationViewController.setNavBarWithTitle(title: "\(currentRepository.fullName ?? "Repositório") - PR")
        destinationViewController.showAlertErrorCallback = {(_  error: String) -> Void in
            UIAlertController.defaultAlertError(onController: self, message: error, backScreen: false)
        }
            
        /*
         Set the height of the preview by setting the preferred content size of the destination view controller. Height: 0.0 to get default height
         */
        destinationViewController.preferredContentSize = CGSize(width: 0.0, height: 0.0)
        if #available(iOS 9.0, *) {
            previewingContext.sourceRect = cell.frame
        } else {
            // Fallback on earlier versions
            return nil
        }
        
        return destinationViewController
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
    
}
