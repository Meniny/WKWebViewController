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
//  Created by Elias Abel on 21/01/2017.
//  Copyright © 2017 Elias Abel. All rights reserved.
//

import UIKit

public struct JustLayoutPercentage {
    let value: CGFloat
}

postfix operator %
public postfix func % (v: CGFloat) -> JustLayoutPercentage {
    return JustLayoutPercentage(value: v)
}

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
    public func size(_ p: JustLayoutPercentage) -> Self {
        width(p)
        height(p)
        return self
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
    public func width(_ p: JustLayoutPercentage) -> Self {
        if let spv = superview {
            widthAttribute == p.value % spv.widthAttribute
        }
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
    public func height(_ p: JustLayoutPercentage) -> Self {
        if let spv = superview {
            heightAttribute == p.value % spv.heightAttribute
        }
        return self
    }
    
    /** Sets the top margin for a view.
     
    Example Usage :
     
     label.top(20)
     label.top(<=20)
     label.top(>=20)
     label.top(20%)
     
    - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func top(_ p: JustLayoutPercentage) -> Self {
        if let spv = superview {
            topAttribute == p.value % spv.bottomAttribute
        }
        return self
    }
    
    /** Sets the aspect for a view.
     
     Example Usage :
     
     label.aspect(ofHeight: 20)
     label.aspect(ofHeight: 100%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func aspect(ofHeight p: JustLayoutPercentage, to view: UIView? = nil) -> Self {
        widthAttribute == p.value % (view ?? self).heightAttribute
        return self
    }
    
    /** Sets the aspect for a view.
     
     Example Usage :
     
     label.aspect(ofWidth: 20)
     label.aspect(ofWidth: 100%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func aspect(ofWidth p: JustLayoutPercentage, to view: UIView? = nil) -> Self {
        heightAttribute == p.value % (view ?? self).widthAttribute
        return self
    }
    
    /** Sets the left margin for a view.
     
     Example Usage :
     
     label.left(20)
     label.left(<=20)
     label.left(>=20)
     label.left(20%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func left(_ p: JustLayoutPercentage) -> Self {
        if let spv = superview {
            leftAttribute == p.value % spv.rightAttribute
        }
        return self
    }
    
    /** Sets the right margin for a view.
     
     Example Usage :
     
     label.right(20)
     label.right(<=20)
     label.right(>=20)
     label.right(20%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func right(_ p: JustLayoutPercentage) -> Self {
        if let spv = superview {
            if p.value == 100 {
                rightAttribute == spv.leftAttribute
            } else {
                rightAttribute == (100 - p.value) % spv.rightAttribute
            }
        }
        return self
    }
    
    /** Sets the bottom margin for a view.
     
     Example Usage :
     
     label.bottom(20)
     label.bottom(<=20)
     label.bottom(>=20)
     label.bottom(20%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func bottom(_ p: JustLayoutPercentage) -> Self {
        if let spv = superview {
            if p.value == 100 {
                bottomAttribute == spv.topAttribute
            } else {
                bottomAttribute == (100 - p.value) % spv.bottomAttribute
            }
        }
        return self
    }
}
