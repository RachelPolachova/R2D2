//
//  UIExtensions.swift
//  R2D2
//
//  Created by Ráchel Polachová on 01/02/2019.
//  Copyright © 2019 Rachel Polachova. All rights reserved.
//

import UIKit

func setActivityViewUI(activityView: UIActivityIndicatorView) {
    
    activityView.isHidden = true
    activityView.backgroundColor = UIColor(hexString: "#545454", alpha: 0.7)
    activityView.clipsToBounds = true
    activityView.layer.cornerRadius = 10
}
