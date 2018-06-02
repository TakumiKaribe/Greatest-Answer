//
//  Question.swift
//  ThisIsTheCorrectAnswerUntilMorning
//
//  Created by 刈部拓未 on 2018/04/29.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation

struct Question: Decodable {
    let id: Int
    let initial: String
    let question: String
}

extension Question {
    static func decode(by data: Data) -> [Question]? {
        do {
            return try JSONDecoder().decode([Question].self, from: data)
        } catch {
            return nil
        }
    }
}
