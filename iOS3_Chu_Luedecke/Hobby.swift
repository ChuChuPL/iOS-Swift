//
//  Hobby.swift
//  iOS3_Chu_Luedecke
//
//  Created by  on 24.11.21.
//

import Foundation

class Hobby : Identifiable, Codable, Equatable{
    var id = UUID()
    var name = String()
    init(name: String) {
        self.name = name
    }
    static func == (erstes: Hobby, zweites: Hobby) -> Bool {
        return erstes.id == zweites.id
    }
}
