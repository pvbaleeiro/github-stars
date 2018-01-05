//
//  CustomRequestAdapter.swift
//  NDGApp
//
//  Created by PEREZ AFANADOR Diana Maria on 20/06/2017.
//  Copyright © 2017 Nestec S.A. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

final class APIController {
    
    fileprivate enum BasicAuthCredentials {
        static let username = InjectionMap.basicAuthConstants.username
        static let password = InjectionMap.basicAuthConstants.password
    }
    
    static let shared: APIController = APIController()
    
    let manager: Alamofire.SessionManager
    
    private init() {
        URLCache.shared.removeAllCachedResponses()
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.timeoutIntervalForRequest = 15
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        let manager = Alamofire.SessionManager(configuration: configuration)
        manager.adapter = CustomRequestAdapter()
        
        self.manager = manager
    }
    
}

extension APIController: WebService {

    func requestResource(url: URL) -> Observable<Bool> {
        return Observable<Bool>.create { [weak self] observer -> Disposable in
            let request = self?.manager
                .request(url, method: .get)
                .responseString(completionHandler: { response in
                    switch response.result {
                    case .success:
                        observer.onNext(true)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                })

            return Disposables.create(with: {
                request?.cancel()
            })
        }
    }

}

final class CustomRequestAdapter: RequestAdapter {
    //private let acceptlanguage: String
    
    init() {
        //acceptlanguage = LocaleManager.locale
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        
        let user = APIController.BasicAuthCredentials.username
        let password = APIController.BasicAuthCredentials.password
        let credentialData = "\(user):\(password)".data(using: .utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
    
        var urlRequest = urlRequest
        
        //urlRequest.setValue(acceptlanguage, forHTTPHeaderField: "Accept-Language")
        urlRequest.setValue("Basic \(base64Credentials)", forHTTPHeaderField: "Authorization")
        
        return urlRequest
    }
}
