//
//  Question.swift
//  ThisIsTheCorrectAnswerUntilMorning
//
//  Created by Takumi Karibe on 2018/04/29.
//  Copyright © 2018年 Takumi Karibe. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

struct Question: Decodable {
    let id: Int
    let statement: String
    
    private func toRealmObject() -> QuestionObject {
        let questionObject = QuestionObject()
        questionObject.id = RealmOptional<Int>(id)
        questionObject.statement = statement
        return questionObject
    }
    
    func add() {
        let obj = toRealmObject()
        let realm = try! Realm()
        realm.beginWrite()
        try! realm.write {
            realm.add(obj)
        }
        try! realm.commitWrite()
    }
    
    static func fetchAll() -> [Question] {
        let realm = try! Realm()
        let results = realm.objects(QuestionObject.self)
        return results.map { $0.toObject() }
    }
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

final class QuestionObject: Object {
    var id = RealmOptional<Int>()
    @objc dynamic var statement: String?
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func toObject() -> Question {
        return Question(id: id.value ?? 0, statement: statement ?? "no statement")
    }
}
