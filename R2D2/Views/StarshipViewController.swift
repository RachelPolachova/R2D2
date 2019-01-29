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
        nameLabel.text = selectedStarship?.name
        classLabel.text = selectedStarship?.starshipClass
        modelLabel.text = selectedStarship?.model
    }

}
