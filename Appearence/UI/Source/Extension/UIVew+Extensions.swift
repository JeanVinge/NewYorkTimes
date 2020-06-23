//
//  UIVew+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public extension UIView {

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }

    func removeAllSubViews() {
        subviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
