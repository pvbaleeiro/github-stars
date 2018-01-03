//
//  Storyboarded.swift
//  NDGApp
//
//  Created by VALDES CUESTA Luis on 18/10/2017.
//  Copyright © 2017 Nestec S.A. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    
    static var storyboardName: String { get }
    static var storyboard: UIStoryboard { get }
}

extension Storyboarded {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName)
    }
}
