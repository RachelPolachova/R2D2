//
//  DescriptionLabel.swift
//  R2D2
//
//  Created by Ráchel Polachová on 04/02/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class DescriptionLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }

}
