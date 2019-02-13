//
//  FilmViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 29/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController {
    
    var selectedFilm: Film?
    
    var titleTextView = TitleTextView()
    var episodeIdLabel = DescriptionLabel()
    var releaseDateLabel = DescriptionLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(titleTextView)
        self.view.addSubview(episodeIdLabel)
        self.view.addSubview(releaseDateLabel)
        
        setupLayout()
        setUI()
    }
    
    func setupLayout() {
        
        titleTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        titleTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        titleTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        
        episodeIdLabel.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 15).isActive = true
        episodeIdLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        episodeIdLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        
        releaseDateLabel.topAnchor.constraint(equalTo: episodeIdLabel.bottomAnchor, constant: 15).isActive = true
        releaseDateLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        releaseDateLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        
    }
    
    func setUI() {
        if let film = selectedFilm {
            titleTextView.text = film.title
            episodeIdLabel.text = "Episode id: \(film.episodeId)"
            releaseDateLabel.text = "Release date: \(film.releaseDate)"
        } else {
            titleTextView.text = "No film selected."
            episodeIdLabel.text = ""
            releaseDateLabel.text = ""
        }
    }

}
