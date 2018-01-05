//
//  RepositoryListInteractor.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 03/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift

class RepositoryListInteractor: RepositoryListInteractorProtocol {
    
    weak var output: RepositoryListInteractorOutputProtocol!
    private var disposeBag = DisposeBag()
    
    func fetchRepositories() {
        
        GithubService.fetchRepositoriesJavaByStars()
            .subscribe(
                onNext: { (repositories) in
                    self.output.repositoriesFetched(repositories)

                }, onError: { (error) in
                    self.output.repositoriesFetchFailed()
                }
            )
            .disposed(by: disposeBag)
    }
}



