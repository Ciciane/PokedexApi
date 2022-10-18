//
//  PokedexResponses.swift
//  Pokemon
//
//  Created by user217410 on 10/17/22.
//

import Foundation
import UIKit

enum PokedexResponse{
    case success(model: PokedexModel)
    case serverError(description: ServerError)
    case timeOut(description: ServerError)
    case noConnection(description: ServerError)
}

enum PokemonResponse{
    case success(model: PokemonModel)
    case serverError(description: ServerError)
    case timeOut(description: ServerError)
    case noConnection(description: ServerError)
}

enum ImageResponse{
    case success(model: Data)
    case serverError(description: ServerError)
    case timeOut(description: ServerError)
    case noConnection(description: ServerError)
}

