//
//  File.swift
//  NDGApp
//
//  Created by PEREZ AFANADOR Diana Maria on 13/11/2017.
//  Copyright © 2017 Nestec S.A. All rights reserved.
//

import Foundation
import UIKit

protocol Reusable {
    static var reuseIdentifier: String { get }
}
extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibReusable: Reusable {
    static var nib: UINib { get }
}

extension NibReusable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension UITableView {
    
    final func register<T: UITableViewCell & NibReusable>(cellType: T.Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UITableViewCell & Reusable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue reusable cell with identifier '\(T.reuseIdentifier)'. Did you forget to register the cell first?")
        }
        return cell
    }
    
//    final func dequeueReusableCell(for indexPath: IndexPath, homeCardType: HomeCardType) -> UITableViewCell {
//        return dequeueReusableCell(withIdentifier: homeCardType.cellIdentifier, for: indexPath)
//    }
    
}
extension UICollectionView {
    
    final func register<T: UICollectionViewCell & NibReusable>(cellType: T.Type) {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UICollectionViewCell & Reusable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue reusable cell with identifier '\(T.reuseIdentifier)'. Did you forget to register the cell first?")
        }
        return cell
    }
    
//    final func dequeueReusableCell(for indexPath: IndexPath, homeCardType: HomeCardType) -> UICollectionViewCell {
//        return dequeueReusableCell(withReuseIdentifier: homeCardType.collectionCellIdentifier, for: indexPath)
//    }
    
}
