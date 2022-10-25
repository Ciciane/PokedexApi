//
//  DetailsViewController.swift
//  Pokemon
//
//  Created by user217410 on 10/19/22.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController, RequestPokedexProtocol {
    
    var requestPokedex: RequestPokedex = RequestPokedex()
    var pokemons = [PokemonModel]()
    var imagePokemons = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchData(pokemonName: String){
        requestPokedex.getDetailsPokemon(name: pokemonName){
            (response) in
            
            switch response{
            case .success(let model):
                self.pokemons.append(model)
                self.loadImagePokemon(url: model.urlImage)
            case .noConnection(let description):
                print(description)
            case .serverError(let description):
                print(description)
            case .timeOut(let description):
                print(description)
            case .invalidResponse:
                print("Invalid Response")
            }
        }
    }
    
    func loadImagePokemon(url: String){
        requestPokedex.getImagePokemon(url: url){
            (response) in
            
            switch response{
            case .success(let model):
                self.imagePokemons.append(model)
            case .noConnection(let description):
                print(description)
            case .serverError(let description):
                print(description)
            case .timeOut(let description):
                print(description)
            case .invalidResponse:
                print("Invalid Response")
            }
        }
    }
}
