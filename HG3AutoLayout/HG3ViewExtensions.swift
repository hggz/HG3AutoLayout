//
//  HG3ViewExtensions.swift
//  HG3AutoLayout
//
//  Created by Hugo Gonzalez on 5/24/15.
//  Copyright (c) 2015 HG3. All rights reserved.
//

import Foundation

public extension UIView {
    //MARK: Initializers
    convenience init(isAutoLayoutView: Bool) {
        self.init()
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
    }
    
    //MARK: Class Functions
    class func autoLayoutViewWithDimensions(width: CGFloat, height: CGFloat) -> UIView {
        var view = UIView(isAutoLayoutView: true)
        view.addConstraints(NSLayoutConstraint.sizeConstraintsForItem(view, width: width, height: height))
        return view
    }
    
    //MARK: Public Functions
    func updateLayoutForView(view: UIView) {
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
}

public extension UIButton {
    //MARK: Class Functions
     class func autoLayoutButtonWithType(buttonType: UIButtonType) -> UIButton {
        var button = self.buttonWithType(buttonType) as! UIButton
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        return button
    }
    
    class func autoLayoutButtonWithTypeAndSize(buttonType: UIButtonType, width: CGFloat, height: CGFloat) -> UIButton {
        var button = autoLayoutButtonWithType(buttonType)
        button.addConstraints(NSLayoutConstraint.sizeConstraintsForItem(button, width: width, height: height))
        return button
    }
}

public extension NSLayoutConstraint {
    //MARK: Class Functions
    class func widthConstraintForItem(item: AnyObject, width: CGFloat) -> NSLayoutConstraint {
        var widthConstraint = NSLayoutConstraint(item: item, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: width)
        return widthConstraint
    }
    
    class func heightConstraintForItem(item: AnyObject, height: CGFloat) -> NSLayoutConstraint {
        var heightConstraint = NSLayoutConstraint(item: item, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: height)
        return heightConstraint
    }
    
    class func sizeConstraintsForItem(item: AnyObject, width: CGFloat, height: CGFloat) -> [NSLayoutConstraint] {
        return [widthConstraintForItem(item, width: width), heightConstraintForItem(item, height: height)]
    }
    
    class func equalWidthConstraintForItems(item1: AnyObject, item2: AnyObject) -> NSLayoutConstraint {
        var widthConstraint = NSLayoutConstraint(item: item1, attribute: .Width, relatedBy: .Equal, toItem: item2, attribute: .Width, multiplier: 1.0, constant: 0)
        return widthConstraint
    }
    
    class func equalHeightConstraintForItems(item1: AnyObject, item2: AnyObject) -> NSLayoutConstraint {
        var heightConstraint = NSLayoutConstraint(item: item1, attribute: .Height, relatedBy: .Equal, toItem: item2, attribute: .Height, multiplier: 1.0, constant: 0)
        return heightConstraint
    }
    
    class func equalSizeConstraintForItems(item1: AnyObject, item2: AnyObject) -> [NSLayoutConstraint] {
        return [equalWidthConstraintForItems(item1, item2: item2), equalHeightConstraintForItems(item1, item2: item2)]
    }
}