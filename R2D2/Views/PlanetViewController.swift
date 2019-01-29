//
//  PlanetViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 29/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class PlanetViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    var selectedPlanet: Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        
    }
    
    func setUI() {
        nameLabel.text = selectedPlanet?.name
        populationLabel.text = selectedPlanet?.population
    }

}
