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
    var types: [Any]?
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

/*struct Tipos {
    var type: {Str}
}*/
