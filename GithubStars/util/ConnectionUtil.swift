//
//  ConnectionUtil.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import Foundation

class ConnectionUtil {
    
    //-------------------------------------------------------------------------------------------------------------
    // MARK: Conexão
    //-------------------------------------------------------------------------------------------------------------
    class func isConnected() ->Bool {
        return !(Reachability()?.connection == Reachability.Connection.none)
    }
}
