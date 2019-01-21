//
//  QuestionCell.swift
//  AsaKore
//
//  Created by Takumi Karibe on 2018/06/02.
//  Copyright © 2018年 Takumi Karibe. All rights reserved.
//

import Foundation
import UIKit

final class QuestionCell: UITableViewCell {
    @IBOutlet private weak var initialLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
}

extension QuestionCell {
    func apply(questionSet: (initial: Initial, question: Question)) {
        initialLabel.text = "「\(questionSet.initial.value)」から始まる"
        questionLabel.text = "\(questionSet.question.statement)は？"
    }
}
