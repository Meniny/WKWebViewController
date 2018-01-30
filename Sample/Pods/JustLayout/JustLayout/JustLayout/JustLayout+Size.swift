//
//  JustLayout
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  No more shall we pray for peace
//  Never ever ask them why
//  No more shall we stop their visions
//  Of selfdestructing genocide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  Screams of terror, panic spreads
//  Bombs are raining from the sky
//  Bodies burning, all is dead
//  There's no place left to hide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  (A voice was heard from the battle field)
//
//  "Couldn't care less for a last goodbye
//  For as I die, so do all my enemies
//  There's no tomorrow, and no more today
//  So let us all fade away..."
//
//  Upon this ball of dirt we lived
//  Darkened clouds now to dwell
//  Wasted years of man's creation
//  The final silence now can tell
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  When I wrote this code, only I and God knew what it was.
//  Now, only God knows!
//
//  So if you're done trying 'optimize' this routine (and failed),
//  please increment the following counter
//  as a warning to the next guy:
//
//  total_hours_wasted_here = 0
//
//  Created by Elias Abel on 10/02/16.
//  Copyright © 2016 Elias Abel. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     Adds an Autolayout constraint for sizing the view.
     
     ```
     image.size(100)
     image.size(100%)
     
     // is equivalent to
     
     image.width(100).height(100)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    public func size(_ points: CGFloat) -> Self {
        width(points)
        height(points)
        return self
    }
    
    /**
     Adds an Autolayout constraint for setting the view's height.
     
     ```
     image.height(100)
     
     // is equivalent to
     
     image ~ 100
     
     // Flexible margins
     image.height(<=100)
     image.height(>=100)
     image.height(100%)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    public func height(_ points: CGFloat) -> Self {
        return size(.height, points: points)
    }
    
    /**
     Adds an Autolayout constraint for setting the view's width.
     
     ```
     image.width(100)
     image.width(<=100)
     image.width(>=100)
     image.width(100%)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    public func width(_ points: CGFloat) -> Self {
        return size(.width, points: points)
    }
    
    /**
     Adds an Autolayout constraint for setting the view's height.
     
     ```
     image.height(100)
     
     // is equivalent to
     
     image ~ 100
     
     // Flexible margins
     image.height(<=100)
     image.height(>=100)
     image.height(100%)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    public func height(_ fm: JustLayoutFlexibleMargin) -> Self {
        return size(.height, relatedBy: fm.relation, points: fm.points)
    }
    
    /**
     Adds an Autolayout constraint for setting the view's width.
     
     ```
     image.width(100)
     image.width(<=100)
     image.width(>=100)
     image.width(100%)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    public func width(_ fm: JustLayoutFlexibleMargin) -> Self {
        return size(.width, relatedBy: fm.relation, points: fm.points)
    }
    
    fileprivate func size(_ attribute: NSLayoutAttribute,
                          relatedBy: NSLayoutRelation = .equal,
                          points: CGFloat) -> Self {
        let c = constraint(item: self,
                           attribute: attribute,
                           relatedBy: relatedBy,
                           constant: points)
        if let spv = superview {
            spv.addConstraint(c)
        } else {
            addConstraint(c)
        }
        return self
    }
}

/**
 Enforces an array of views to keep the same size.
 
 ```
 equal(sizes: image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
@discardableResult
public func equal<T>(sizes views: T...) -> [T] where T: UIView {
    return equal(sizes: views)
}

/**
 Enforces an array of views to keep the same size.
 
 ```
 equal(sizes: image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
@discardableResult
public func equal<T>(sizes views: [T]) -> [T] where T: UIView {
    equal(heights: views)
    equal(widths: views)
    return views
}

/**
 Enforces an array of views to keep the same widths.
 
 ```
 equal(widths: image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
@discardableResult
public func equal<T>(widths views: T...) -> [T] where T: UIView {
    return equal(widths: views)
}

/**
 Enforces an array of views to keep the same widths.
 
 ```
 equal(widths: image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
@discardableResult
public func equal<T>(widths views: [T]) -> [T] where T: UIView {
    equal(.width, views: views)
    return views
}

/**
 Enforces an array of views to keep the same heights.
 
 ```
 equal(heights: image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
@discardableResult
public func equal<T>(heights views: T...) -> [T] where T: UIView {
    return equal(heights: views)
}


/**
 Enforces an array of views to keep the same heights.
 
 ```
 equal(heights: image1, image2, image3)
 ```
 
 - Returns: The views enabling chaining.
 
 */
@discardableResult
public func equal<T>(heights views: [T]) -> [T] where T: UIView {
    equal(.height, views: views)
    return views
}

private func equal<T>(_ attribute: NSLayoutAttribute, views: [T]) where T: UIView {
    var previousView: T?
    for v in views {
        if let pv = previousView {
            if let spv = v.superview {
                spv.addConstraint(item: v, attribute: attribute, toItem: pv)
            }
        }
        previousView = v
    }
}
