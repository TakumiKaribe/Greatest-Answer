//
//  QuestionViewControllerViewModel.swift
//  ThisIsTheCorrectAnswerUntilMorning
//
//  Created by 刈部拓未 on 2018/04/29.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation

/// QuestionsViewModel
struct QuestionViewControllerViewModel {
    var questions = [Question]()
    
    init() {
        guard let data = fetchJsonFile() else { return }
        guard let questions = decodeFile(by: data) else { return }
        self.questions = questions
    }
}

// MARK: - Extension
extension QuestionViewControllerViewModel {
    func randNum() -> Int {
        return Int(arc4random_uniform(UInt32(questions.count)))
    }
}


// MARK: - Private Extension
private extension QuestionViewControllerViewModel {
    func fetchJsonFile() -> Data? {
        do {
            return try Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "PreparedProblems", ofType: "json")!))
            
        } catch {
            return nil
        }
    }
    
    func decodeFile(by data: Data) -> [Question]? {
        do {
            return try JSONDecoder().decode([Question].self, from: data)
            
        } catch {
            return nil
        }
    }
}
