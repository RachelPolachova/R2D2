//
//  PersonViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 29/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var selectedPerson: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        
    }
    
    func setUI() {
        nameLabel.text = selectedPerson?.name
        birthYearLabel.text = selectedPerson?.birthYear
        heightLabel.text = selectedPerson?.height
    }

}
