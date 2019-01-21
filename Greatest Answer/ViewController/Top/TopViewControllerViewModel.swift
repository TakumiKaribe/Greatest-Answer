//
//  TopViewControllerViewModel.swift
//  AsaKore
//
//  Created by Takumi Karibe on 2018/06/02.
//  Copyright © 2018年 Takumi Karibe. All rights reserved.
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
        var ret: [(Initial, Question)] = []
        (0...2).forEach { _ in 
            let randomQ = Int(arc4random_uniform(UInt32(questions.count)))
            let randomH = Int(arc4random_uniform(UInt32(initials.count)))
            let question = (initials[randomH], questions[randomQ])
            ret.append(question)
        }
        return ret
    }
}

// MARK: - Private Extension
private extension TopViewControllerViewModel {
    func setUpQuestions() {
        guard let questions = Question.decode(by: JsonStore.fetch(.question)) else { return }
        self.questions = questions
    }
    
    func setUpHiraganas() {
        guard let initials = Initial.decode(by: JsonStore.fetch(.initial)) else { return }
        self.initials = initials
    }
}
