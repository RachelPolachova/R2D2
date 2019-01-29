//
//  VehicleViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 29/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class VehicleViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    
    var selectedVehicle: Vehicle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        
    }
    
    func setUI() {
        nameLabel.text = selectedVehicle?.name
        modelLabel.text = selectedVehicle?.model
    }

}
