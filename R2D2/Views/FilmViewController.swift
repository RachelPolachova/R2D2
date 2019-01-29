//
//  FilmViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 29/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var episodeIdLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var selectedFilm: Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUI()

        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        titleLabel.text = selectedFilm?.title
        episodeIdLabel.text = "\(selectedFilm?.episodeId)"
        releaseDateLabel.text = selectedFilm?.releaseDate
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
