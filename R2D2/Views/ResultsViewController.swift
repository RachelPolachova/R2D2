//
//  ResultsViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 29/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit
import Alamofire

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var resultsNameArray = [String]()
    var charactersFilmsArray = [String]()
    var selectedResult: Any?
    var results: Any?
    var attributeValue = ""
    let dispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        processResult()
        
        setActivityViewUI(activityView: activityView)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath)
        cell.textLabel?.text = resultsNameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: \(resultsNameArray[indexPath.row])")
        
        switch results {
        case let res as CharactersResult:
            
            selectedResult = res.results[indexPath.row]
            charactersFilmsArray.removeAll()
            
            for filmUrl in res.results[indexPath.row].films {
                getCharactersFilms(urlString: filmUrl)
            }
            
            
            dispatchGroup.notify(queue: .main) {
                self.activityView.stopAnimating()
                self.activityView.isHidden = true
                self.performSegue(withIdentifier: "goToCharacterSegue", sender: nil)
            }
            
        case let res as FilmsResult:
            selectedResult = res.results[indexPath.row]
            performSegue(withIdentifier: "goToFilmSegue", sender: nil)
        case let res as SpeciesResult:
            selectedResult = res.results[indexPath.row]
            performSegue(withIdentifier: "goToSpecieSegue", sender: nil)
        case let res as PlanetsResult:
            selectedResult = res.results[indexPath.row]
            performSegue(withIdentifier: "goToPlanetSegue", sender: nil)
        case let res as VehiclesResult:
            selectedResult = res.results[indexPath.row]
            performSegue(withIdentifier: "goToVehicleSegue", sender: nil)
        case let res as StarshipsResult:
            selectedResult = res.results[indexPath.row]
            performSegue(withIdentifier: "goToStarshipSegue", sender: nil)
        default:
            print("def")
        }
        
    }
    
    func getCharactersFilms(urlString : String) {
        dispatchGroup.enter()
        
        activityView.startAnimating()
        activityView.isHidden = false
        
        guard let url = URL(string: urlString) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            if let data = response.data {
                do {
                    let film = try decoder.decode(Film.self, from: data)
                    self.charactersFilmsArray.append(film.title)
                } catch let err {
                    print("Error while decoding character's film: \(err)")
                }
            }
            self.dispatchGroup.leave()
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "goToCharacterSegue":
            let vc = segue.destination as! CharacterViewController
            vc.selectedCharacter = selectedResult as? Character
            vc.charactersFilms = charactersFilmsArray
        case "goToFilmSegue":
            let vc = segue.destination as! FilmViewController
            vc.selectedFilm = selectedResult as? Film
        case "goToSpecieSegue":
            let vc = segue.destination as! SpecieViewController
            vc.selectedSpecie = selectedResult as? Specie
        case "goToPlanetSegue":
            let vc = segue.destination as! PlanetViewController
            vc.selectedPlanet = selectedResult as? Planet
        case "goToVehicleSegue":
            let vc = segue.destination as! VehicleViewController
            vc.selectedVehicle = selectedResult as? Vehicle
        case "goToStarshipSegue":
            let vc = segue.destination as! StarshipViewController
            vc.selectedStarship = selectedResult as? Starship
        default:
            print("default")
        }
        
    }
    
    
    
    func processResult() {
        
        switch results {
        case let res as CharactersResult:
            for item in res.results {
                resultsNameArray.append(item.name)
            }
        case let res as FilmsResult:
            for item in res.results {
                resultsNameArray.append(item.title)
            }
        case let res as SpeciesResult:
            for item in res.results {
                resultsNameArray.append(item.name)
            }
        case let res as PlanetsResult:
            for item in res.results {
                resultsNameArray.append(item.name)
            }
        case let res as VehiclesResult:
            for item in res.results {
                resultsNameArray.append(item.name)
            }
        case let res as StarshipsResult:
            for item in res.results {
                resultsNameArray.append(item.name)
            }
        default:
            print("default")
        }
    }

}
