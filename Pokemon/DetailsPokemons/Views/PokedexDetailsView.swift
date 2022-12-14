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
    var idPokemon: Int
    var typePokemon: [Any]
    var imagePokemon: UIImage
    let controller = DetailsViewController()
    var typesName = [String]()
    
    let imageViewPokemon: UIImageView = {
        let imageViewPokemon = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        imageViewPokemon.contentMode = .scaleAspectFit
        imageViewPokemon.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageViewPokemon.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageViewPokemon.translatesAutoresizingMaskIntoConstraints = false
        
        return imageViewPokemon
    }()
    
    let idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.text = "Id"
        idLabel.font = UIFont.systemFont(ofSize: 15)
        idLabel.numberOfLines = 0
        idLabel.textAlignment = .left
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        return idLabel
    }()
    
    var namePokemonLb: UILabel = {
        var namePokemonLb = UILabel()
        namePokemonLb.text = "Name"
        namePokemonLb.font = UIFont.boldSystemFont(ofSize: 20)
        namePokemonLb.numberOfLines = 0
        namePokemonLb.textAlignment = .left
        namePokemonLb.translatesAutoresizingMaskIntoConstraints = false
        return namePokemonLb
    }()
    
    let typePokemonLb: UILabel = {
        let typePokemonLb = UILabel()
        typePokemonLb.text = "Type"
        typePokemonLb.font = UIFont.systemFont(ofSize: 15)
        typePokemonLb.numberOfLines = 0
        typePokemonLb.textAlignment = .left
        typePokemonLb.translatesAutoresizingMaskIntoConstraints = false
        return typePokemonLb
    }()
    
    let abilityPokemonLb: UILabel = {
        let abilityPokemonLb = UILabel()
        abilityPokemonLb.text = "Ability"
        abilityPokemonLb.font = UIFont.systemFont(ofSize: 15)
        abilityPokemonLb.numberOfLines = 0
        abilityPokemonLb.textAlignment = .left
        abilityPokemonLb.translatesAutoresizingMaskIntoConstraints = false
        return abilityPokemonLb
    }()
    
    init(namePokemon: String, idPokemon: Int, typePokemon: [Any], imagePokemon: UIImage){
        self.namePokemon = namePokemon
        self.idPokemon = idPokemon
        self.typePokemon = typePokemon
        self.imagePokemon = imagePokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("Init not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureTypePokemon(typePokemon: typePokemon)

        namePokemonLb.text = namePokemon.capitalized
        idLabel.text = "Pokemon Id \(idPokemon)"
        typePokemonLb.text = "Tipos: \(typesName.description)"
        imageViewPokemon.image = imagePokemon
        setup()
        
    }
    
    private func configureTypePokemon(typePokemon: [Any]){ //-> String{
        
        var typesAndSlot = [[String: Any]]()
        typesAndSlot = typePokemon as! [[String : Any]]
        var types = [[String: Any]]()
        var namesAndUrls = [[String: Any]]()
        
        for i in typesAndSlot {
            types.append(i["type"] as! [String: Any])
            for index in i {
                if index.key == "type" {
                    namesAndUrls.append(index.value as! [String: Any])
                }
            }
         }
     
        
        for i in namesAndUrls {
            typesName.append(i["name"] as! String)
        }
    }

    private func setup() {
        view.backgroundColor = .white
        
        self.view.addSubview(imageViewPokemon)
        NSLayoutConstraint.activate([
            imageViewPokemon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            imageViewPokemon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            imageViewPokemon.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
        
        self.view.addSubview(idLabel)
        NSLayoutConstraint.activate([
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idLabel.topAnchor.constraint(equalTo: imageViewPokemon.bottomAnchor, constant: 15)
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
