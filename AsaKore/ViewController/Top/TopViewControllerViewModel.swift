//
//  TopViewControllerViewModel.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/02.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation

final class TopViewControllerViewModel {
    private(set) var initials: [Initial] = []
    private(set) var questions: [Question] = []
    init() {
        setUpQuestions()
        setUpHiraganas()
    }
}

// MARK: - Extension
extension TopViewControllerViewModel {
    func fetchTripleQuestion() -> [(Initial, Question)] {
        var rtn: [(Initial, Question)] = []
        (0...2).forEach { _ in 
            let randomQ = Int(arc4random_uniform(UInt32(questions.count)))
            let randomH = Int(arc4random_uniform(UInt32(initials.count)))
            let question = (initials[randomH], questions[randomQ])
            rtn.append(question)
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
    
    func setUpHiraganas() {
        guard let data = JsonStore.Initial.fetch() else { return }
        guard let initials = Initial.decode(by: data) else { return }
        self.initials = initials
    }
}
