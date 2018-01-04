//
//  CommonViewProtocol.swift
//  NDGApp
//
//  Created by Diego Peinador on 16/02/2017.
//  Copyright © 2017 Nestec S.A. All rights reserved.
//

/**
 This protocol should be the parent of all ViewProtocols. Add here common methods to all views.
 These methods are implemented in a extension to UIViewController in the file 
 UIViewController+CommonViewProtocol.swift.
 */
protocol CommonViewProtocol: class {

    func showSppinerHeader()
    func showSppinerFooter()
    func removeAllSppiners()
}
