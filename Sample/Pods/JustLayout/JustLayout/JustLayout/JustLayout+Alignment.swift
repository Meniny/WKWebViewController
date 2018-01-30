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

/** Aligns an array of views Horizontally (on the X Axis)
 
 Example Usage:
 ```
 align(horizontally: label,button,arrow)
 ```
 
 Ca also be used directly on horizontal layouts since they return the array of views :
 ```
 align(horizontally: |-image1-image2-image3-|)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(horizontally views: T...) -> [T] where T: UIView {
    return align(horizontally: views)
}

/** Aligns an array of views Horizontally (on the X Axis)
 
 Example Usage:
 ```
 align(horizontally: label,button,arrow)
 ```
 
 Ca also be used directly on horizontal layouts since they return the array of views :
 ```
 align(horizontally: |-image1-image2-image3-|)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(horizontally views: [T]) -> [T] where T: UIView {
    align(.horizontal, views: views)
    return views
}

/** Aligns an array of views Vertically (on the Y Axis)
 
 Example Usage:
 ```
 align(vertically: label,field,button)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(vertically views: T...) -> [T] where T: UIView {
    align(vertically: views)
    return views
}

/** Aligns an array of views Vertically (on the Y Axis)
 
 Example Usage:
 ```
 align(vertically: label,field,button)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(vertically views: [T]) -> [T] where T: UIView {
    align(.vertical, views: views)
    return views
}

/** Aligns the center of two views
 
 Example Usage:
 ```
 alignCenter(button, with:image)
 ```
 */
public func align<T>(center v1: T, with v2: T) where T: UIView {
    align(horizontally: v1, with: v2)
    align(vertically: v1, with: v2)
}

/** Aligns two views Horizontall (on the X Axis)
 
 Example Usage:
 ```
 alignHorizontally(label, with:field)
 ```
 
 */
public func align<T>(horizontally v1: T, with v2: T, offset: CGFloat = 0) where T: UIView {
    align(.horizontal, v1: v1, with: v2, offset: offset)
}

/** Aligns two views Vertically (on the Y Axis)
 
 Example Usage:
 ```
 alignVertically(label, with:field)
 ```
 
 */
public func align<T>(vertically v1: T, with v2: T, offset: CGFloat = 0) where T: UIView {
    align(.vertical, v1: v1, with: v2, offset: offset)
}

public func align<T>(_ axis: UILayoutConstraintAxis, views: [T]) where T: UIView {
    for (i, v) in views.enumerated() where views.count > i+1 {
        let v2 = views[i+1]
        if axis == .horizontal {
            align(horizontally: v, with: v2)
        } else {
            align(vertically: v, with: v2)
        }
    }
}

public func align<T>(_ axis: UILayoutConstraintAxis, v1: T, with v2: T, offset: CGFloat) where T: UIView {
    if let spv = v1.superview {
        let center: NSLayoutAttribute = axis == .horizontal ? .centerY : .centerX
        let c = constraint(item: v1, attribute: center, toItem: v2, constant:offset)
        spv.addConstraint(c)
    }
}

// MARK: Align sides

/** Aligns tops of an array of views
 
 Example Usage:
 ```
 align(tops: label,button,arrow)
 ```
 
 Ca also be used directly on horizontal layouts since they return the array of views :
 ```
 align(tops: |-image1-image2-image3-|)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(tops views: T...) -> [T] where T: UIView {
    return align(tops: views)
}

/** Aligns tops of an array of views
 
 Example Usage:
 ```
 align(tops: label,button,arrow)
 ```
 
 Ca also be used directly on horizontal layouts since they return the array of views :
 ```
 align(tops: |-image1-image2-image3-|)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(tops views: [T]) -> [T] where T: UIView {
    align(.top, views: views)
    return views
}

/** Aligns bottoms of an array of views
 
 Example Usage:
 ```
 align(bottoms: label,button,arrow)
 ```
 
 Ca also be used directly on horizontal layouts since they return the array of views :
 ```
 align(bottoms: |-image1-image2-image3-|)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(bottoms views: T...) -> [T] where T: UIView {
    return align(bottoms: views)
}

/** Aligns bottoms of an array of views
 
 Example Usage:
 ```
 align(bottoms: label,button,arrow)
 ```
 
 Ca also be used directly on horizontal layouts since they return the array of views :
 ```
 align(bottoms: |-image1-image2-image3-|)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(bottoms views: [T]) -> [T] where T: UIView {
    align(.bottom, views: views)
    return views
}

/** Aligns left sides of an array of views
 
 Example Usage:
 ```
 align(lefts: label,field,button)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(lefts views: T...) -> [T] where T: UIView {
    return align(lefts: views)
}

/** Aligns left sides of an array of views
 
 Example Usage:
 ```
 align(lefts: label,field,button)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(lefts views: [T]) -> [T] where T: UIView {
    align(.left, views: views)
    return views
}

/** Aligns right sides of an array of views
 
 Example Usage:
 ```
 align(rights: label,field,button)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(rights views: T...) -> [T] where T: UIView {
    return align(rights: views)
}

/** Aligns right sides of an array of views
 
 Example Usage:
 ```
 align(rights: label,field,button)
 ```
 
 - Returns: The array of views, enabling chaining,
 
 */
@discardableResult
public func align<T>(rights views: [T]) -> [T] where T: UIView {
    align(.right, views: views)
    return views
}

@discardableResult
public func align<T>(_ attribute: NSLayoutAttribute, views: [T]) -> [T] where T: UIView {
    for (i, v) in views.enumerated() where views.count > i+1 {
        let v2 = views[i+1]
        if let spv = v.superview {
            let c = constraint(item: v, attribute: attribute, toItem: v2)
            spv.addConstraint(c)
        }
    }
    return views
}
