//
//  QuestionCell.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/02.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation
import UIKit

final class QuestionCell: UITableViewCell {
    @IBOutlet private weak var initialLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    
    static let height: CGFloat = 88
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension QuestionCell {
    func apply(question: Question) {
        initialLabel.text = "「\(question.initial)」から始まる"
        questionLabel.text = "\(question.question)は？"
    }
}
