//
//  APIGithub.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation
import ObjectMapper

//-------------------------------------------------------------------------------------------------------------
// MARK: Urls
//-------------------------------------------------------------------------------------------------------------
enum URLGithub: String {
    case javaByStars = "/search/repositories?q=language:Java&sort=stars&page={page}"
}


class ApiGithub {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Metodos
    //-------------------------------------------------------------------------------------------------------------
    class func getRepositoriesJavaByStars(page: Int, completion: ((ResponseCall<Any>)->())? = nil) {
        
        //Url a ser chamada
        let urlCall: String = NSString(format:"%@%@", ConfigManager.sharedInstance.endpoint(), URLGithub.javaByStars.rawValue).replacingOccurrences(of: URLParameters.page.rawValue, with: String(page)) as String
        
        //Chamada web
        APIManager.sharedInstance.customRequest(httpMethod: .get, url: urlCall, parameters: nil, headers: ConfigManager.sharedInstance.defaultHeaders()) { (response) -> () in
            
            //Não conectado
            if (!response.connected) {
                completion!(ResponseCall.onNoConnection())
                
            } else if (response.objectFromServer != nil && response.httpCode == HttpCodeResponse.success.rawValue) {
                
                //Conversões
                guard let repositories = Mapper<RepositoryList>().map(JSONObject: response.objectFromServer) else {
                    return completion!(ResponseCall.onFailure(response))
                }
                
                completion!(ResponseCall.onSuccess(repositories))
                
            } else {
                completion!(ResponseCall.onFailure(response))
            }
        }
    }
    
    class func getUserDetail(url: String, completion: ((ResponseCall<Any>)->())? = nil) {
        
        //Chamada web
        APIManager.sharedInstance.customRequest(httpMethod: .get, url: url, parameters: nil, headers: ConfigManager.sharedInstance.defaultHeaders()) { (response) -> () in
            
            //Não conectado
            if (!response.connected) {
                completion!(ResponseCall.onNoConnection())
                
            } else if (response.objectFromServer != nil && response.httpCode == HttpCodeResponse.success.rawValue) {
                
                //Conversões
                guard let user = Mapper<UserDetail>().map(JSONObject: response.objectFromServer) else {
                    return completion!(ResponseCall.onFailure(response))
                }
                
                completion!(ResponseCall.onSuccess(user))
                
            } else {
                completion!(ResponseCall.onFailure(response))
            }
        }
    }
    
    class func getUserPullRequests(url: String, completion: ((ResponseCall<Any>)->())? = nil) {
        
        //Url a ser chamada
        let urlCall: String = NSString(format:"%@", url).replacingOccurrences(of: URLParameters.number.rawValue, with: URLParameters.stateAdd.rawValue) as String
        
        //Chamada web
        APIManager.sharedInstance.customRequest(httpMethod: .get, url: urlCall, parameters: nil, headers: ConfigManager.sharedInstance.defaultHeaders()) { (response) -> () in
            
            //Não conectado
            if (!response.connected) {
                completion!(ResponseCall.onNoConnection())
                
            } else if (response.objectFromServer != nil && response.httpCode == HttpCodeResponse.success.rawValue) {
                
                //Conversões para array
                let pullRequestList: Array = (response.objectFromServer as! NSArray) as Array
                
                var finalList: Array<PullRequest> = Array()
                for pr in pullRequestList {
                    
                    //Converte objeto
                    let pullRequestObject = Mapper<PullRequest>().map(JSONObject: pr)
                    finalList.append(pullRequestObject!)
                }
                
                completion!(ResponseCall.onSuccess(finalList))
                
            } else {
                completion!(ResponseCall.onFailure(response))
            }
        }
    }
    
    class func getAvatar(url: String, onImageView: UIImageView) {
        APIManager.sharedInstance.loadImageOnView(fromUrl: URL(string: url)!, onImageView: onImageView)
    }
}
