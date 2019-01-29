//
//  ResultsViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 29/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var resultsArray = [String]()
    var resultObjectsArray = [Any]()
    var selectedResult: Any?
    var results: Any?
    var attributeValue = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let res = results as? PersonResult {
//            print("name of res in resultVC: \(res.results[0].name)")
//        }
        
        processResult()
        
        print("results in results vc: \(results)")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultObjectsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath)
        cell.textLabel?.text = resultsArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: \(resultsArray[indexPath.row])")
        
        switch results {
        case let res as PersonsResult:
            selectedResult = res.results[indexPath.row]
            performSegue(withIdentifier: "goToPersonSegue", sender: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "goToPersonSegue":
            let vc = segue.destination as! PersonViewController
            vc.selectedPerson = selectedResult as? Person
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
        case let res as PersonsResult:
            for item in res.results {
                resultsArray.append(item.name)
                resultObjectsArray.append(res)
            }
        case let res as FilmsResult:
            for item in res.results {
                resultsArray.append(item.title)
                resultObjectsArray.append(res)
            }
        case let res as SpeciesResult:
            for item in res.results {
                resultsArray.append(item.name)
                resultObjectsArray.append(res)
            }
        case let res as PlanetsResult:
            for item in res.results {
                resultsArray.append(item.name)
                resultObjectsArray.append(res)
            }
        case let res as VehiclesResult:
            for item in res.results {
                resultsArray.append(item.name)
                resultObjectsArray.append(res)
            }
        case let res as StarshipsResult:
            for item in res.results {
                resultsArray.append(item.name)
                resultObjectsArray.append(res)
            }
        default:
            print("default")
        }
    }

}
