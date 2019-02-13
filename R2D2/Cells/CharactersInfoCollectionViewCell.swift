//
//  CharactersInfoCollectionViewCell.swift
//  R2D2
//
//  Created by Ráchel Polachová on 01/02/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class CharactersInfoCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    let nameLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = "Unknown"
        
        return label
        
    }()
    
    func setupView() {
        
        addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
