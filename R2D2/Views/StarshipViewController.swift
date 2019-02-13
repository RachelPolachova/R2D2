//
//  StarshipViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 29/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class StarshipViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    
    var selectedStarship: Starship?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    func setUI() {
        if let starship = selectedStarship {
            nameLabel.text = starship.name
            classLabel.text = "Class: \(starship.starshipClass)"
            modelLabel.text = "Model: \(starship.model)"
        } else {
            nameLabel.text = "No starship selected"
            classLabel.text = ""
            modelLabel.text = ""
        }
    }

}
