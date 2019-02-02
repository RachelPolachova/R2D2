//
//  CharacterViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 29/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit
import Alamofire

class CharacterViewController: UIViewController{

    var selectedCharacter: Character?
    var selectedSpecie: Specie?
    var charactersFilms = [Film]()
    var charactersSpecies = [Specie]()
    var selectedFilm: Film?
    
    let dispatchGroup = DispatchGroup()
    var activityView : UIView?
    
    var nameTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Unknown name"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.font = .systemFont(ofSize: 30)
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
        
    }()
    
    var birthTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Unknown brith year"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var heightTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Unknown height"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let filmsCollectionIdentifier = "filmCell"
    let filmsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.backgroundColor = UIColor.white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        
        return collection
        
    }()
    
    let speciesCollectionIdentifier = "specieCell"
    let speciesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        
        return collection
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValues()
        
        filmsCollection.delegate = self
        filmsCollection.dataSource = self
        filmsCollection.register(CharactersInfoCollectionViewCell.self, forCellWithReuseIdentifier: filmsCollectionIdentifier)
        
        speciesCollection.delegate = self
        speciesCollection.dataSource = self
        speciesCollection.register(CharactersInfoCollectionViewCell.self, forCellWithReuseIdentifier: speciesCollectionIdentifier)
        
        
        self.view.addSubview(nameTextView)
        self.view.addSubview(birthTextView)
        self.view.addSubview(heightTextView)
        self.view.addSubview(filmsCollection)
        self.view.addSubview(speciesCollection)
        
        setupLayout()
        activityView = setActivityView()
        activityView?.isHidden = true
        
    }
    
    // MARK: UI methods
    
    func setupLayout() {
        
        nameTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        nameTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        birthTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        birthTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 15).isActive = true
        birthTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        heightTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heightTextView.topAnchor.constraint(equalTo: birthTextView.bottomAnchor, constant: 10).isActive = true
        heightTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        filmsCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        filmsCollection.topAnchor.constraint(equalTo: heightTextView.bottomAnchor, constant: 10).isActive = true
        filmsCollection.heightAnchor.constraint(equalToConstant: 200).isActive = true
        filmsCollection.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        speciesCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        speciesCollection.topAnchor.constraint(equalTo: filmsCollection.bottomAnchor, constant: 15).isActive = true
        speciesCollection.heightAnchor.constraint(equalToConstant: 200).isActive = true
        speciesCollection.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
    }
    
    func setValues() {
        
        if let name = selectedCharacter?.name {
            nameTextView.text = name
        } else {
            nameTextView.text = "Unknown name"
        }
        
        if let birthYear = selectedCharacter?.birthYear {
            birthTextView.text = "Birth year: \(birthYear)"
        } else {
            birthTextView.text = "Unknown birth year"
        }
        
        if let height = selectedCharacter?.height {
            heightTextView.text = "Height: \(height)"
        } else {
            heightTextView.text = "Unknown height"
        }
        
    }
    
    // MARK: Segue methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToFilmsDetailsSegue" {
            let filmVC = segue.destination as! FilmViewController
            filmVC.selectedFilm = selectedFilm
        } else if segue.identifier == "goToSpeciesDetailsSegue" {
            let specieVC = segue.destination as! SpecieViewController
            print("Preparing segue, selected specie is: \(selectedSpecie)")
            specieVC.selectedSpecie = selectedSpecie
        }
        
        
        
        
    }
    
    // MARK: API methods
    
    func getFilm(urlString: String) {
        dispatchGroup.enter()
        activityView?.isHidden = false
        
        
        guard let url = URL(string: urlString) else { return }
        Alamofire.request(url).responseJSON { (response) in
            
            if let data = response.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let film = try decoder.decode(Film.self, from: data)
                    self.selectedFilm = film
                } catch let err {
                    print("error while decoding film: \(err)")
                }
            }
            self.dispatchGroup.leave()
        }
    }
    
    func getSpecie(urlString: String) {
        dispatchGroup.enter()
        activityView?.isHidden = false
        
        guard let url = URL(string: urlString) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            if let data = response.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let specie = try decoder.decode(Specie.self, from: data)
                    self.selectedSpecie = specie
                    print("Selected specie is: \(specie.name)")
                } catch let err {
                    print("Error while decoding specie: \(err)")
                }
            }
            self.dispatchGroup.leave()
        }
    }
    
}

extension CharacterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: CollectionView delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == filmsCollection {
            return charactersFilms.count
        }
        
        return charactersSpecies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == filmsCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filmsCollectionIdentifier, for: indexPath) as! CharactersInfoCollectionViewCell
            cell.backgroundColor = .gray
            cell.nameTextView.text = charactersFilms[indexPath.row].title
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: speciesCollectionIdentifier, for: indexPath) as! CharactersInfoCollectionViewCell
        cell.backgroundColor = .red
        cell.nameTextView.text = charactersSpecies[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: 200, height: collectionViewSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == filmsCollection {
            getFilm(urlString: charactersFilms[indexPath.row].url)
            dispatchGroup.notify(queue: .main) {
                self.activityView?.isHidden = true
                self.performSegue(withIdentifier: "goToFilmsDetailsSegue", sender: nil)
            }
        } else if collectionView == speciesCollection {
            getSpecie(urlString: charactersSpecies[indexPath.row].url)
            dispatchGroup.notify(queue: .main) {
                self.activityView?.isHidden = true
                self.performSegue(withIdentifier: "goToSpeciesDetailsSegue", sender: nil)
            }
        }
    }
    
}


