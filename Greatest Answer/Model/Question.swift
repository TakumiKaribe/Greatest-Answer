//
//  Question.swift
//  ThisIsTheCorrectAnswerUntilMorning
//
//  Created by Takumi Karibe on 2018/04/29.
//  Copyright © 2018年 Takumi Karibe. All rights reserved.
//

import Foundation

struct Question: Decodable {
    let id: Int
    let value: String
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
