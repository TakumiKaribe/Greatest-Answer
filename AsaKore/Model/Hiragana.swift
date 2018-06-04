//
//  Hiragana.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/04.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation

struct Hiragana: Decodable {
    let value: String
}

extension Hiragana {
    static func decode(by data: Data) -> [Hiragana]? {
        do {
            return try JSONDecoder().decode([Hiragana].self, from: data)
        } catch {
            return nil
        }
    }
}
