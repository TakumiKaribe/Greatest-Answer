//
//  TopViewControllerViewModel.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/02.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation

struct TopViewControllerViewModel {
    private var questions: [Question]?
    init() { setUpQuestions() }
}

// MARK: - Extension
extension TopViewControllerViewModel {
    func fetchTripleQuestion() -> [Question] {
        guard let questions = questions else { return [] }
        var rtn: [Question] = []
        (0...2).forEach { _ in 
            let random = Int(arc4random_uniform(UInt32(questions.count)))
            rtn.append(questions[random])
        }
        return rtn
    }
}

// MARK: - Private Extension
private extension TopViewControllerViewModel {
    func setUpQuestions() {
        guard let data = JsonStore.Question.fetch() else { return }
        guard let questions = Question.decode(by: data) else { return }
        self.questions = questions
    }
}
