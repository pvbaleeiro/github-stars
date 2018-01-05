//
//  GithubService.swift
//  GithubStars
//
//  Created by Paulo Ferreira on 04/01/18.
//  Copyright © 2018 Victor Baleeiro. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import AlamofireObjectMapper

class GithubService {
    
    static func fetchRepositoriesJavaByStars() -> Observable<RepositoryList> {
        
        //Url a ser chamada
        let urlCall: String = NSString(format:"%@%@", ConfigManager.sharedInstance.endpoint(), URLGithub.javaByStars.rawValue).replacingOccurrences(of: URLParameters.page.rawValue, with: String(0)) as String
        
        return Observable<RepositoryList>.create { observer -> Disposable in
            let request = Alamofire
                .request(urlCall, method: .get)
                .validate()
                .responseObject(completionHandler: { (response: DataResponse<RepositoryList>) in
                    switch response.result {
                    case .success(let repositories):
                        observer.onNext(repositories)
                        observer.onCompleted()
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                })
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
    
    static func fetchUserPullRequests(url: String) -> Observable<[PullRequest]> {
        
        //Url a ser chamada
        let urlCall: String = NSString(format:"%@", url).replacingOccurrences(of: URLParameters.number.rawValue, with: URLParameters.stateAdd.rawValue) as String
        
        return Observable<[PullRequest]>.create { observer -> Disposable in
            let request = Alamofire
                .request(urlCall, method: .get)
                .validate()
                .responseArray(completionHandler: { (response: DataResponse<[PullRequest]>) in
                    switch response.result {
                    case .success(let pullRequests):
                        observer.onNext(pullRequests)
                        observer.onCompleted()
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                })
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
}
