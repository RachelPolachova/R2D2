//
//  ApiCallsExtension.swift
//  R2D2
//
//  Created by Ráchel Polachová on 31/01/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit
import Alamofire


extension UIViewController {
    
    func getFilm(requestUrl: String, dispatchGroup: DispatchGroup, completion: @escaping (Film)->() ){
        
        dispatchGroup.enter()
        
        guard let url = URL(string: requestUrl) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            
            if let data = response.data {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let filmData = try decoder.decode(Film.self, from: data)
                    completion(filmData)
                } catch let err {
                    print("Error whie decoding film: \(err)")
                }
            }
            
        }
        
        dispatchGroup.leave()
        
//        return film
        
    }
    
}
