//
//  LoadViewCell.swift
//  Pokemon
//
//  Created by user217410 on 10/18/22.
//

import Foundation
import UIKit

class LoadViewCell: UITableViewCell {
    
    // MARK: - Component
    lazy var loadActivity: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.color = .white
        view.startAnimating()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(loadActivity)
        NSLayoutConstraint.activate([
            loadActivity.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadActivity.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
