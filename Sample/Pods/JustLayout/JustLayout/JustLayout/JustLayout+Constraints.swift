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
//  Created by Elias Abel on 01/10/15.
//  Copyright © 2015 Elias Abel. All rights reserved.
//

import UIKit

// MARK: - Shortcut

public extension UIView {
    
    /**
     Helper for creating and adding NSLayoutConstraint but with default values provided.
     
     For instance
     
        addConstraint(item: view1, attribute: .CenterX, toItem: view2)
     
     is equivalent to
     
         addConstraint(
            NSLayoutConstraint(item: view1,
                attribute: .CenterX,
                 relatedBy: .Equal,
                 toItem: view2,
                 attribute: .CenterX,
                 multiplier: 1,
                 constant: 0
            )
         )
     
     - Returns: The NSLayoutConstraint created.
     */
    @discardableResult
    public func addConstraint(item view1: AnyObject,
                              attribute attr1: NSLayoutAttribute,
                              relatedBy: NSLayoutRelation = .equal,
                              toItem view2: AnyObject? = nil,
                              attribute attr2: NSLayoutAttribute? = nil,
                              multiplier: CGFloat = 1,
                              constant: CGFloat = 0) -> NSLayoutConstraint {
        let c = constraint(
            item: view1, attribute: attr1,
            relatedBy: relatedBy,
            toItem: view2, attribute: attr2,
            multiplier: multiplier, constant: constant)
        addConstraint(c)
        return c
    }
}

/**
    Helper for creating a NSLayoutConstraint but with default values provided.
 
 For instance 
 
        constraint(item: view1, attribute: .CenterX, toItem: view2)
 
  is equivalent to
 
        NSLayoutConstraint(item: view1, attribute: .CenterX,
        relatedBy: .Equal,
        toItem: view2, attribute: .CenterX,
        multiplier: 1, constant: 0)
 
    - Returns: The NSLayoutConstraint created.
 */
public func constraint(item view1: AnyObject,
                       attribute attr1: NSLayoutAttribute,
                       relatedBy: NSLayoutRelation = .equal,
                       toItem view2: AnyObject? = nil,
                       attribute attr2: NSLayoutAttribute? = nil, // Not an attribute??
                       multiplier: CGFloat = 1,
                       constant: CGFloat = 0) -> NSLayoutConstraint {
        let c =  NSLayoutConstraint(item: view1, attribute: attr1,
                                  relatedBy: relatedBy,
                                  toItem: view2, attribute: ((attr2 == nil) ? attr1 : attr2! ),
                                  multiplier: multiplier, constant: constant)
    c.priority = UILayoutPriority(rawValue: UILayoutPriority.defaultHigh.rawValue + 1)
    return c
}

// MARK: - Other

public extension UIView {

    /**
     Makes a view follow another view's frame.
     For instance if we want a button to be on top of an image :
     
     ```
     button.followEdges(image)
     ```
     */
    public func followEdges<T>(_ otherView: T) where T: UIView {
        if let spv = superview {
            let cs = [
                constraint(item: self, attribute: .top, toItem: otherView),
                constraint(item: self, attribute: .right, toItem: otherView),
                constraint(item: self, attribute: .bottom, toItem: otherView),
                constraint(item: self, attribute: .left, toItem: otherView)
            ]
            spv.addConstraints(cs)
        }
    }
    
    /**
     Enforce a view to keep height and width equal at all times, essentially
     forcing it to be a square.
     
     ```
     image.heightEqualsWidth()
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    public func heightEqualsWidth() -> UIView {
        if let spv = superview {
            let c = constraint(item: self, attribute: .height, toItem: self, attribute: .width)
            spv.addConstraint(c)
        }
        return self
    }
    
}
