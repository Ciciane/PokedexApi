//
//  PokedexViewController.swift
//  Pokemon
//
//  Created by user217410 on 10/18/22.
//

import Foundation
import UIKit

struct CellIdentifier {
    static let LoadCell = "loadCell"
    static let NormalCell = "cell"
    static let EmptyCell = "emptyCell"
}

class PokedexViewController: UITableViewController, RequestPokedexProtocol {
    
    let pokemonViewCell = PokemonViewCell()
    var requestPokedex: RequestPokedex = RequestPokedex()
    var resultModel: PokedexModel?
    var resultCount = 0
    var pokemons = [PokemonModel]()
    var imagePokemons = [Data]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
    }
    
    func showPokedex(url: String?){
        requestPokedex.getAllPokemons(url: url){
            (response) in
            
            switch response {
                
            case .success(let model):
                self.resultModel = model
                self.showPokemons(self.resultCount+1)
                self.resultCount += model.results
                
            case .serverError(let description):
                print(description)
                
            case .timeOut(let description):
                print(description)
                
            case .noConnection(let description):
                print(description)
                
            case .invalidResponse:
                print("Invalid Response")
            }
        }
    }
    
    func showPokemons(_ id: Int){
        requestPokedex.getPokemon(id: id){
            (response) in
            
            switch response {
                
            case .success(let model):
                self.pokemons.append(model)
                self.showImagePokemon(url: model.urlImage)
                
            case .serverError(let description):
                print(description)
                
            case .timeOut(let description):
                print(description)
                
            case .noConnection(let description):
                print(description)
                
            case .invalidResponse:
                print("Invalid Response")
            }
        }
    }
    
    func showImagePokemon(url: String){
        requestPokedex.getImagePokemon(url: url){
            (response) in
            
            switch response {
                
            case .success(let model):
                self.imagePokemons.append(model)
                self.pokemons.last!.id < self.resultCount ?
                self.showPokemons(self.pokemons.last!.id + 1) : self.tableView.reloadData()
                
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
    
    func registerCell() {
        tableView.register(LoadViewCell.self, forCellReuseIdentifier: "loadCell")
        tableView.register(PokemonViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func convertUrlToUIImage(url: String) -> UIImage? {
        guard let urlConvert = URL(string: url), let data = try? Data(contentsOf: urlConvert) else {
            return nil
        }
        
        let image = UIImage(data: data)
        return image
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultModel?.next == "" ? resultCount : resultCount + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == resultCount {
            guard let cellLoad = tableView.dequeueReusableCell(withIdentifier: "loadCell", for: indexPath) as? LoadViewCell else {
                return tableView.dequeueReusableCell(withIdentifier: CellIdentifier.EmptyCell, for: indexPath)
            }
            
            cellLoad.loadActivity.startAnimating()
            return cellLoad
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.NormalCell, for: indexPath) as? PokemonViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: CellIdentifier.EmptyCell, for: indexPath)
        }
        
        cell.configureCell(withModel: pokemons[indexPath.row], pokemonSpriteData: imagePokemons[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.NormalCell) as? PokemonViewCell

        let pokemon = pokemons[indexPath.row].name
        let id = pokemons[indexPath.row].id
        let type = pokemons[indexPath.row].types
        let urlImage = pokemons[indexPath.row].urlImage
        
        if !urlImage.isEmpty {
            guard let pokemonImage = convertUrlToUIImage(url: urlImage) else {
                return
            }
            var detailsView = PokedexDetailsView(namePokemon: pokemon, idPokemon: id, typePokemon: type, imagePokemon: pokemonImage)
            navigationController?.pushViewController(detailsView, animated: true)
        }else {
            var detailsView = PokedexDetailsView(namePokemon: pokemon, idPokemon: id, typePokemon: type, imagePokemon: UIImage())
            navigationController?.pushViewController(detailsView, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
   
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == resultCount {
            showPokedex(url: resultModel?.next)
        }
    }
    
}
//0x600001a48000
