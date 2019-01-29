//
//  ViewController.swift
//  R2D2
//
//  Created by Ráchel Polachová on 23/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //get them from API call
    let attributes = ["films", "people", "planets", "species", "starships", "vehicles"]
    var selectedAttribute = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (view.frame.size.width - 20) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attributes.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "attributeCell", for: indexPath) as! AttributeCollectionViewCell
        cell.attributeName.text = attributes[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedAttribute = attributes[indexPath.row]
        performSegue(withIdentifier: "goToSearchSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSearchSegue" {
            let searchVC = segue.destination as! SearchViewController
            searchVC.attributeValue = selectedAttribute
        }
    }

}

