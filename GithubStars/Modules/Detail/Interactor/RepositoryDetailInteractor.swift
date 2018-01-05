//
//  RepositoryDetailInteractor.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 05/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation
import RxSwift

class RepositoryDetailInteractor: RepositoryDetailInteractorProtocol {
    
    weak var output: RepositoryDetailInteractorOutputProtocol!
    private var disposeBag = DisposeBag()
    
    func fetchPullRequests(url: String) {
        
        GithubService.fetchUserPullRequests(url: url)
            .subscribe(
                onNext: { (pullRequests) in
                    self.output.pullRequestsFetched(pullRequests)
                    
            }, onError: { (error) in
                self.output.pullRequestsFetchFailed()
            }
            )
            .disposed(by: disposeBag)
    }
}

