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
    
    let nameTextView: UITextView = {
        
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.backgroundColor = nil
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 18)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.text = "Custom cell"
        
        return textView
        
    }()
    
    func setupView() {
        
        addSubview(nameTextView)
        
        nameTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameTextView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        nameTextView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        nameTextView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
