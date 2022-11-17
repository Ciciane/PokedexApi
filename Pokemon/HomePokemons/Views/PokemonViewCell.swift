//
//  PokemonViewCell.swift
//  Pokemon
//
//  Created by user217410 on 10/18/22.
//

import Foundation
import UIKit

class PokemonViewCell: UITableViewCell {
    
    let imgView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    let pokemonIdLb: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pokemonNameLb: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func configureCell(withModel model: PokemonModel, pokemonSpriteData data:Data) {
        self.pokemonIdLb.text = "Pokemon Id \(model.id)"
        self.pokemonNameLb.text = model.name.capitalized
        self.imgView.image = UIImage(data: data)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        contentView.addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
        
        contentView.addSubview(pokemonIdLb)
        NSLayoutConstraint.activate([
            pokemonIdLb.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            pokemonIdLb.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20),
            pokemonIdLb.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            pokemonIdLb.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        contentView.addSubview(pokemonNameLb)
        NSLayoutConstraint.activate([
            pokemonNameLb.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 20),
            pokemonNameLb.topAnchor.constraint(equalTo: pokemonIdLb.bottomAnchor, constant: 5),
            pokemonNameLb.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            pokemonNameLb.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
