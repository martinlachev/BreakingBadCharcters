//
//  Character.swift
//  BreakingBadCharacters
//
//  Created by Martin Lachev on 22.09.20.
//  Copyright © 2020 Marto Lachev. All rights reserved.
//

import Foundation


struct Character: Codable {
    let charId, name, img: String
    
    enum CodingKeys: String, CodingKey {
        case name, img
        case charId = "char_id"
    }
}

extension Character {
    init?(data: Data) {
        do {
            let me = try JSONDecoder().decode(Character.self, from: data)
            self = me
        }
        catch {
            print(error)
            return nil
        }
    }
}
