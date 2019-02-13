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
        
        print("In specieVC: selected is: \(selectedSpecie?.name)")

        setUI()
    }
    

    func setUI() {
        
        if let specie = selectedSpecie {
            nameLabel.text = specie.name
            classificationLabel.text = "Classification: \(specie.classification)"
            avgHeightLabel.text = "Average height: \(specie.averageHeight)"
        } else {
            nameLabel.text = "No specie selected"
            classificationLabel.text = ""
            avgHeightLabel.text = ""
        }
    }

}
