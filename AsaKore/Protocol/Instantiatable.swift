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

extension UITableViewCell: Instantiatable {}
extension Instantiatable where Self: UITableViewCell {
    static func registered(in tableView: UITableView) {
        let className = String(describing: self)
        let nib = UINib(nibName: className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: className)
    }
    
    static func dequeue(from tableView: UITableView, at indexPath: IndexPath) -> Self {
        let className = String(describing: self)
        return tableView.dequeueReusableCell(withIdentifier: className, for: indexPath) as! Self
    }
}
