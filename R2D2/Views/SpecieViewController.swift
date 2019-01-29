//
//  SpecieViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 29/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class SpecieViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var avgHeightLabel: UILabel!
    
    var selectedSpecie: Specie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    

    func setUI() {
        nameLabel.text = selectedSpecie?.name
        classificationLabel.text = selectedSpecie?.classification
        avgHeightLabel.text = selectedSpecie?.averageHeight
    }

}
