//
//  TitleTextView.swift
//  R2D2
//
//  Created by Ráchel Polachová on 04/02/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class TitleTextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        isEditable = false
        isScrollEnabled = false
        font = .systemFont(ofSize: 30)
    }
    
}
