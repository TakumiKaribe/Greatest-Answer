//
//  JsonStore.swift
//  AsaKore
//
//  Created by 刈部拓未 on 2018/06/02.
//  Copyright © 2018年 刈部拓未. All rights reserved.
//

import Foundation

struct JsonStore {
    struct Question {
        static func fetch() -> Data! {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Questions", ofType: "json")!))
            } catch {
                return nil
            }
        }
    }
    
    struct Initial {
        static func fetch() -> Data! {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Initial", ofType: "json")!))
            } catch {
                return nil
            }
        }
    }
}
