//
//  PokedexModel.swift
//  Pokemon
//
//  Created by user217410 on 10/17/22.
//

import Foundation
import UIKit

struct PokedexModel {
    let count: Int
    let next: String
    let previous: String
    let results: Int
}

extension PokedexModel {
    init() {
        self.count = 0
        self.next = ""
        self.previous = ""
        self.results = 0
    }
}
