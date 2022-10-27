//
//  PokemonModel.swift
//  Pokemon
//
//  Created by user217410 on 10/17/22.
//

import Foundation
import UIKit

struct PokemonModel {
    var id: Int
    var name: String
    var urlImage: String
    let types: [Any]
    var ability: String
}

extension PokemonModel{
    init()
    {
        self.id = 0
        self.name = ""
        self.urlImage = ""
        self.types = []
        self.ability = ""
    }
}

// MARK: - TypeElement
struct TypeElement {
    let slot: Int?
    let type: TypeType?
}

// MARK: - TypeType
struct TypeType {
    let name: String?
    let url: String?
}
