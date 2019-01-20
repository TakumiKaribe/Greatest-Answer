//
//  Instantiatable.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/02.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation
import UIKit

protocol Instantiatable {}
extension UIViewController: Instantiatable {}
extension Instantiatable where Self: UIViewController {
    static func instantiate() -> Self {
        let className = String(describing: self)
        let storyBoard = UIStoryboard(name: className, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: className) as! Self
    }
}

extension UITableView {
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        let className = String(describing: cellType)
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func dequeue<T: UITableViewCell>(_ cellType: T.Type, indexPath: IndexPath) -> T {
        let className = String(describing: cellType)
        return dequeueReusableCell(withIdentifier: className, for: indexPath) as! T
    }
}
