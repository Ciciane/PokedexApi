//
//  PokedexDetailsView.swift
//  Pokemon
//
//  Created by user217410 on 10/19/22.
//

import Foundation
import UIKit

class PokedexDetailsView: UIViewController {
    
    var namePokemon: String
    let controller = DetailsViewController()
    
    let imagePokemon: UIImageView = {
        let imagePokemon = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        imagePokemon.contentMode = .scaleAspectFill
        imagePokemon.layer.cornerRadius = 8
        imagePokemon.clipsToBounds = true
        imagePokemon.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imagePokemon.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imagePokemon.translatesAutoresizingMaskIntoConstraints = false
        
        return imagePokemon
    }()
    
    let idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.font = UIFont.systemFont(ofSize: 15)
        idLabel.numberOfLines = 0
        idLabel.textAlignment = .left
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        return idLabel
    }()
    
    let namePokemonLb: UILabel = {
        let namePokemonLb = UILabel()
        namePokemonLb.font = UIFont.boldSystemFont(ofSize: 20)
        namePokemonLb.numberOfLines = 0
        namePokemonLb.textAlignment = .left
        namePokemonLb.translatesAutoresizingMaskIntoConstraints = false
        return namePokemonLb
    }()
    
    let typePokemonLb: UILabel = {
        let typePokemonLb = UILabel()
        typePokemonLb.font = UIFont.systemFont(ofSize: 15)
        typePokemonLb.numberOfLines = 0
        typePokemonLb.textAlignment = .left
        typePokemonLb.translatesAutoresizingMaskIntoConstraints = false
        return typePokemonLb
    }()
    
    let abilityPokemonLb: UILabel = {
        let abilityPokemonLb = UILabel()
        abilityPokemonLb.font = UIFont.systemFont(ofSize: 15)
        abilityPokemonLb.numberOfLines = 0
        abilityPokemonLb.textAlignment = .left
        abilityPokemonLb.translatesAutoresizingMaskIntoConstraints = false
        return abilityPokemonLb
    }()
    
    init(namePokemon: String){
        self.namePokemon = namePokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("Init not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller.fetchData(pokemonName: namePokemon)
        setup()
    
    }
    
    public func configureView(withModel model: PokemonModel, pokemonSpriteData data: Data) {
        self.idLabel.text = "#\(model.id)"
        self.namePokemonLb.text = model.name
        self.imagePokemon.image = UIImage(data: data)
    //    self.typePokemonLb.text = model.types
        self.abilityPokemonLb.text = model.ability
    }
    
    private func setup() {
        view.backgroundColor = .red
        
        self.view.addSubview(imagePokemon)
        NSLayoutConstraint.activate([
            imagePokemon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            imagePokemon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            imagePokemon.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        ])
        
        self.view.addSubview(idLabel)
        NSLayoutConstraint.activate([
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
       //     idLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -34),
            idLabel.topAnchor.constraint(equalTo: imagePokemon.bottomAnchor, constant: 15)
        ])
        
        self.view.addSubview(namePokemonLb)
        NSLayoutConstraint.activate([
            namePokemonLb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            namePokemonLb.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 30)
        ])
        
        self.view.addSubview(typePokemonLb)
        NSLayoutConstraint.activate([
            typePokemonLb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            typePokemonLb.topAnchor.constraint(equalTo: namePokemonLb.bottomAnchor, constant: 15)
        ])
        
        self.view.addSubview(abilityPokemonLb)
        NSLayoutConstraint.activate([
            abilityPokemonLb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            abilityPokemonLb.topAnchor.constraint(equalTo: typePokemonLb.bottomAnchor, constant: 30)
        ])
    }
}
