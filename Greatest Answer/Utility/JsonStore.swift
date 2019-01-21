//
//  JsonStore.swift
//  AsaKore
//
//  Created by Takumi Karibe on 2018/06/02.
//  Copyright © 2018年 Takumi Karibe. All rights reserved.
//

import Foundation

struct JsonStore {
    enum Kind {
        case question, initial
        var name: String {
            switch self {
            case .question: return "Questions"
            case .initial:  return "Initial"
            }
        }
    }
    
    static func fetch(_ kind: Kind) -> Data! {
        do {
            return try Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: kind.name, ofType: "json")!))
        } catch {
            return nil
        }
    }
}
