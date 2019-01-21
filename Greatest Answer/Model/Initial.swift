//
//  Initial.swift
//  AsaKore
//
//  Created by Takumi Karibe on 2018/06/04.
//  Copyright © 2018年 Takumi Karibe. All rights reserved.
//

import Foundation

struct Initial: Decodable {
    let value: String
}

extension Initial {
    static func decode(by data: Data) -> [Initial]? {
        do {
            return try JSONDecoder().decode([Initial].self, from: data)
        } catch {
            return nil
        }
    }
}
