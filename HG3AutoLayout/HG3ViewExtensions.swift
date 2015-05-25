//
//  HG3ViewExtensions.swift
//  HG3AutoLayout
//
//  Created by Hugo Gonzalez on 5/24/15.
//  Copyright (c) 2015 HG3. All rights reserved.
//

import Foundation

extension UIView {
    func newAutoLayoutObject() -> UIView {
        var view = UIView()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        return view
    }
    
    func updateLayoutForView(view: UIView) {
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
}

public class HG3Framework {
    public init() {
    }
}