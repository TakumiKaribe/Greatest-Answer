//
//  StoryBoardInstantiatable.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/02.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation
import UIKit

protocol StoryBoardInstantiatable {}
extension StoryBoardInstantiatable where Self: UIViewController {
    static func instantiate() -> Self {
        let className = String(describing: self)
        let storyBoard = UIStoryboard(name: className, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: className) as! Self
    }
}

extension UIViewController: StoryBoardInstantiatable {}
