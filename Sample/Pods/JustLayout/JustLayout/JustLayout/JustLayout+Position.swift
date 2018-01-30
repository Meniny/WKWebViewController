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
    
    /** Sets the left margin for a view.
     
    Example Usage :
     
     label.left(20)
     label.left(<=20)
     label.left(>=20)
     label.left(20%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func left(_ points: CGFloat) -> Self {
        return position(.left, points: points)
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
    public func right(_ points: CGFloat) -> Self {
        return position(.right, points: -points)
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
    public func top(_ points: CGFloat) -> Self {
        return position(.top, points: points)
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
    public func bottom(_ points: CGFloat) -> Self {
        return position(.bottom, points: -points)
    }
    
    /** Sets the aspect for a view.
     
     Example Usage :
     
     label.aspect(ofHeight: 20)
     label.aspect(ofHeight: 100%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func aspect(ofHeight p: CGFloat) -> Self {
        return aspect(ofHeight: p%)
    }
    
    /** Sets the aspect for a view.
     
     Example Usage :
     
     label.aspect(ofWidth: 20)
     label.aspect(ofWidth: 100%)
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func aspect(ofWidth p: CGFloat) -> Self {
        return aspect(ofWidth: p%)
    }
    
    // MARK: - Flexible

    /** Sets the left margin for a view.
     
    Example Usage :
     
     label.left(20)
     label.left(<=20)
     label.left(>=20)
     label.left(20%)
     
    - Returns: Itself for chaining purposes
    */
    @discardableResult
    public func left(_ fm: JustLayoutFlexibleMargin) -> Self {
        return position(.left, relatedBy:fm.relation, points: fm.points)
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
    public func right(_ fm: JustLayoutFlexibleMargin) -> Self {
        // For right this should be inverted.
        var n = JustLayoutFlexibleMargin()
        n.points = -fm.points
        if fm.relation == .greaterThanOrEqual {
            n.relation = .lessThanOrEqual
        }
        if fm.relation == .lessThanOrEqual {
            n.relation = .greaterThanOrEqual
        }
        return position(.right, relatedBy:n.relation, points: n.points)
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
    public func top(_ fm: JustLayoutFlexibleMargin) -> Self {
        return position(.top, relatedBy:fm.relation, points: fm.points)
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
    public func bottom(_ fm: JustLayoutFlexibleMargin) -> Self {
        // For bottom this should be inverted.
        var n = JustLayoutFlexibleMargin()
        n.points = -fm.points
        if fm.relation == .greaterThanOrEqual {
            n.relation = .lessThanOrEqual
        }
        if fm.relation == .lessThanOrEqual {
            n.relation = .greaterThanOrEqual
        }
        return position(.bottom, relatedBy:n.relation, points: n.points)
    }
    
    fileprivate func position(_ position: NSLayoutAttribute,
                              relatedBy: NSLayoutRelation = .equal,
                              points: CGFloat) -> Self {
        if let spv = superview {
            let c = constraint(item: self, attribute: position,
                               relatedBy:relatedBy,
                               toItem: spv,
                               constant: points)
            spv.addConstraint(c)
        }
        return self
    }
}
