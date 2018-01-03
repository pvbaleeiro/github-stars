//
//  APIManager.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage


//-------------------------------------------------------------------------------------------------------------
// MARK: Constants / Enums
//-------------------------------------------------------------------------------------------------------------
public enum HttpCodeResponse: Int {
    case success = 200
    case unauthorized = 401
    case rateLimitExceeded = 403
    case requestTimeout = 408 //Utilizado como default
}

public enum ResponseCall<T> {
    case onSuccess(T)
    case onFailure(T)
    case onNoConnection()
}

public enum URLParameters: String {
    case page = "{page}"
    case number = "{/number}"
    case stateAdd = "?state=all"
}

public enum FriendlyMessages: String {
    case serverError = "Nenhuma resposta válida do servidor. Verifique sua conexão ou tente executar a operação novamente."
    case rateLimitExceeded = "Nós atingimos o limite máximo de acessos à API do Github. Tente novamente em alguns minutos."
}

struct AlamofireAppManager {
    
    static let shared: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        return sessionManager
    }()
    
}


class APIManager {
    static let sharedInstance = APIManager()
    
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Método principal de chamadas
    //-------------------------------------------------------------------------------------------------------------
    func customRequest(httpMethod: HTTPMethod, url: URLConvertible, parameters: [String: Any]?, headers: HTTPHeaders, completion: @escaping (_ apiResponse: APIResponse)->()) {
        
        //Loga a url chamada
        LogUtil.log(title: "Url chamada", forClass: String(describing: APIManager.self), method: #function, line: #line, description: String(describing: url))
        
        //Obtem status da conexão
        let httpResponse = APIResponse()
        httpResponse.connected = ConnectionUtil.isConnected()
        
        //Verifica se está conectado
        if (httpResponse.connected) {
         
            //Tenta realizar o request
            AlamofireAppManager.shared.request(url, method: httpMethod, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON {
                (response) in
                
                switch response.result {
                case .success:
                    httpResponse.objectFromServer = response.result.value
                    httpResponse.httpCode = (response.response?.statusCode)!
                    break
                    
                case .failure(let error):
                    httpResponse.objectFromServer = error
                    httpResponse.httpCode = (response.response != nil) ? (response.response?.statusCode)! : HttpCodeResponse.requestTimeout.rawValue
                    httpResponse.friendlyMessage = (httpResponse.httpCode == HttpCodeResponse.rateLimitExceeded.rawValue) ? FriendlyMessages.rateLimitExceeded.rawValue : FriendlyMessages.serverError.rawValue
                    break
                }
                
                completion(httpResponse)
            }
        } else {
            completion(httpResponse)
        }
    }
    
    func loadImageOnView(fromUrl: URL, onImageView: UIImageView) {
        
        //Seta a imagem
        let placeholderImage = UIImage(named: "placeholder_avatar")!
        onImageView.af_setImage(withURL: fromUrl, placeholderImage: placeholderImage)
    }
}
