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
    class func widthConstraintForItem(item: UIView, width: CGFloat) -> NSLayoutConstraint {
        var widthConstraint = NSLayoutConstraint(item: item, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: width)
        return widthConstraint
    }
    
    class func heightConstraintForItem(item: UIView, height: CGFloat) -> NSLayoutConstraint {
        var heightConstraint = NSLayoutConstraint(item: item, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: height)
        return heightConstraint
    }
    
    class func sizeConstraintsForItem(item: UIView, width: CGFloat, height: CGFloat) -> [NSLayoutConstraint] {
        return [widthConstraintForItem(item, width: width), heightConstraintForItem(item, height: height)]
    }
    
    class func equalWidthConstraintForItems(item1: UIView, item2: UIView) -> NSLayoutConstraint {
        var widthConstraint = NSLayoutConstraint(item: item1, attribute: .Width, relatedBy: .Equal, toItem: item2, attribute: .Width, multiplier: 1.0, constant: 0)
        return widthConstraint
    }
    
    class func equalHeightConstraintForItems(item1: UIView, item2: UIView) -> NSLayoutConstraint {
        var heightConstraint = NSLayoutConstraint(item: item1, attribute: .Height, relatedBy: .Equal, toItem: item2, attribute: .Height, multiplier: 1.0, constant: 0)
        return heightConstraint
    }
    
    class func equalSizeConstraintForItems(item1: UIView, item2: UIView) -> [NSLayoutConstraint] {
        return [equalWidthConstraintForItems(item1, item2: item2), equalHeightConstraintForItems(item1, item2: item2)]
    }
    
    class func centerViewY(view: UIView, containerView: UIView) -> NSLayoutConstraint {
        var yConstraint = NSLayoutConstraint(item: containerView, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0)
        return yConstraint
    }
    
    class func centerViewX(view: UIView, containerView: UIView) -> NSLayoutConstraint {
        var xConstraint = NSLayoutConstraint(item: containerView, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0)
        return xConstraint
    }
    
    class func centerViewXY(view: UIView, containerView: UIView) -> [NSLayoutConstraint] {
        return [centerViewX(view, containerView: containerView), centerViewY(view, containerView: containerView)]
    }
    
    class func trailingConstraintToSV(view: UIView, containerView: UIView, constant: CGFloat) -> NSLayoutConstraint {
        var trailingConstraint = NSLayoutConstraint(item: containerView, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing , multiplier: 1.0, constant: constant)
        return trailingConstraint
    }
    
    class func leadingConstraintToSV(view: UIView, containerView: UIView, constant: CGFloat) -> NSLayoutConstraint {
        var leadingConstraint = NSLayoutConstraint(item: view, attribute: .Leading, relatedBy: .Equal, toItem: containerView, attribute: .Leading , multiplier: 1.0, constant: constant)
        return leadingConstraint
    }
}