//
//  SearchViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 24/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit
import Alamofire



class SearchViewController: UIViewController {
    

    @IBOutlet weak var searchInput: UITextField!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var attributeValue = ""
    var results: Any?
    var nextPage = false
    let dispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setActivityViewUI(activityView: activityView)
        
    }
    
    // MARK: result VC
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultsVC = segue.destination as! ResultsViewController
        resultsVC.attributeValue = attributeValue
        resultsVC.results = results
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        
        if let searching = searchInput.text {
            let urlString = "https://swapi.co/api/\(attributeValue)/?search=\(searching)"
            print(urlString)
            getRequest(urlString: urlString)
        }
        
        dispatchGroup.notify(queue: .main) {
            self.activityView.stopAnimating()
            self.activityView.isHidden = true
            self.performSegue(withIdentifier: "goToResultsSegue", sender: nil)
        }
        
    }
    
    
    //    MARK: API methods
    
    func getRequest(urlString: String) {
        
        dispatchGroup.enter()
        activityView.isHidden = false
        activityView.startAnimating()
        
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        Alamofire.request(url).responseJSON { (response) in
            print("Request:  \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
            
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            if let data = response.data {
                
                switch self.attributeValue {
                    
                case "people": self.parseCharactersJSON(data: data, decoder: decoder)
                case "films": self.parseFilmsResultJSON(data: data, decoder: decoder)
                case "planets": self.parsePlanetsJSON(data: data, decoder: decoder)
                case "species": self.parseSpeciesJSON(data: data, decoder: decoder)
                case "starships": self.parseStarshipsJSON(data: data, decoder: decoder)
                case "vehicles": self.parseVehiclesJSON(data: data, decoder: decoder)
                default:
                    print("No attribute")
                }
                
            }
            self.dispatchGroup.leave()
        }
    }
    
    
    // parse JSON methods
    
    func parseCharactersJSON(data: Data, decoder: JSONDecoder) {
        do {
            
            let characters = try decoder.decode(CharactersResult.self, from: data)
            
            
            // check if it's first page, if not, just append persons.
            if characters.previous != nil {
                var res = results as! CharactersResult
                for item in characters.results {
                    res.results.append(item)
                }
                results = res
            } else {
                
                results = characters
            }
            
            if let nextPageUrl = characters.next {
                getRequest(urlString: nextPageUrl)
            }
            
        } catch let err{
            print("Error while decoding person: \(err)")
        }
    }
    
    func parseFilmsResultJSON(data: Data, decoder: JSONDecoder) {
        do {
            let films = try decoder.decode(FilmsResult.self, from: data)
            
            if films.previous != nil {
                var res = results as! FilmsResult
                for item in films.results {
                    res.results.append(item)
                }
                results = res
            } else {
                results = films
            }
            
            if let nextPageUrl = films.next {
                getRequest(urlString: nextPageUrl)
            }
            
        } catch let err {
            print("Error while decoding film: \(err)")
        }
    }
    
    func parseStarshipsJSON(data: Data, decoder: JSONDecoder) {
        do {
            let starships = try decoder.decode(StarshipsResult.self, from: data)
            
            if starships.previous != nil {
                var res = results as! StarshipsResult
                for item in starships.results {
                    res.results.append(item)
                }
                results = res
            } else {
                results = starships
            }
            
            if let nextPageUrl = starships.next {
                getRequest(urlString: nextPageUrl)
            }
            
        } catch let err {
            print("Error while decoding starship: \(err)")
        }
    }
    
    func parsePlanetsJSON(data: Data, decoder: JSONDecoder) {
        do {
            let planets = try decoder.decode(PlanetsResult.self, from: data)
            
            if planets.previous != nil {
                var res = results as! PlanetsResult
                for item in planets.results {
                    res.results.append(item)
                }
                results = res
            } else {
                results = planets
            }
            
            if let nextPageUrl = planets.next {
                getRequest(urlString: nextPageUrl)
            }
            
        } catch let err {
            print("Error while decoding planet: \(err)")
        }
    }
    
    func parseSpeciesJSON(data: Data, decoder: JSONDecoder) {
        do {
            let species = try decoder.decode(SpeciesResult.self, from: data)
            
            if species.previous != nil {
                var res = results as! SpeciesResult
                for item in species.results {
                    res.results.append(item)
                }
                results = res
            } else {
                results = species
            }
            
            if let nextPageUrl = species.next {
                getRequest(urlString: nextPageUrl)
            }
            
        } catch let err {
            print("Error while decoding Specie: \(err)")
        }
        
    }
    
    func parseVehiclesJSON(data: Data, decoder: JSONDecoder) {
        do {
            let vehicles = try decoder.decode(VehiclesResult.self, from: data)
            
            if vehicles.previous != nil {
                var res = results as! VehiclesResult
                for item in vehicles.results {
                    res.results.append(item)
                }
                results = res
            } else {
                results = vehicles
            }
            
            if let nextPageUrl = vehicles.next {
                getRequest(urlString: nextPageUrl)
            }
            
        } catch let err {
            print("Error while decoding vehicle: \(err)")
        }
    }
    
}
