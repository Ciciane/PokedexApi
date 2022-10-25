//
//  ParsePokedex.swift
//  Pokemon
//
//  Created by user217410 on 10/17/22.
//

import Foundation
import UIKit

typealias ParseReponseDict = [String: Any]?
typealias PokemonSpriteDict = [String: Any]

class ParsePokedex {

    func parseAllPokedex(response: [String: Any]?) ->PokedexModel{
        guard let response = response else { return PokedexModel() }
        
        let count = response["count"] as? Int ?? 0
        let next = response["next"] as? String ?? ""
        let previus = response["previus"] as? String ?? ""
        
        let resultList = response["results"] as? [[String: Any]] ?? []
        let results = resultList.count
        
        return PokedexModel(count: count, next: next, previous: previus, results: results)
        
    }
    
    func parsePokemon(response: [String: Any]?) ->PokemonModel{
        guard let response = response else { return PokemonModel() }
        
        let name = response["name"] as? String ?? ""
        let id = response["id"] as? Int ?? 0
        let sprites = response["sprites"] as? [String: Any]
        let urlImage = sprites?["front_default"] as? String ?? ""
        let types = response["types"] as? [Any] ?? []
        let ability = response["ability"] as? String ?? ""
        
        return PokemonModel(id: id, name: name, urlImage: urlImage, types: types, ability: ability)
        
    }
}
