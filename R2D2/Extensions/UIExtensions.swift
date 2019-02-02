//
//  UIExtensions.swift
//  R2D2
//
//  Created by Ráchel Polachová on 01/02/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

extension UIViewController {

    func setActivityView() -> UIView {
        let activityView = UIView.init(frame: self.view.bounds)
        activityView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.startAnimating()
        activityIndicator.center = activityView.center
        activityView.addSubview(activityIndicator)
        view.addSubview(activityView)
        
        return activityView
        
    }
    
}
