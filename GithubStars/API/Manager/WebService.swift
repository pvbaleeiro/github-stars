//
//  WebService.swift
//  NDGApp
//
//  Created by ALARCON GALLO Ernesto on 10/11/17.
//  Copyright © 2017 Nestec S.A. All rights reserved.
//

import Foundation
import RxSwift

protocol WebService {
    func requestResource(url: URL) -> Observable<Bool>
}
