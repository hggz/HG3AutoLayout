//
//  HG3ViewExtensions.swift
//  HG3AutoLayout
//
//  Created by Hugo Gonzalez on 5/24/15.
//  Copyright (c) 2015 HG3. All rights reserved.
//

import Foundation

public extension UIView {
    convenience init(isAutoLayoutView: Bool) {
        self.init()
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
    }
    
    func updateLayoutForView(view: UIView) {
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
}
