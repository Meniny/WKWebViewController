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

prefix operator |
@discardableResult
public prefix func | (p: UIView) -> UIView {
    return p.left(0)
}

postfix operator |
@discardableResult
public postfix func | (p: UIView) -> UIView {
    return p.right(0)
}

prefix operator |-
@discardableResult
public prefix func |- (p: CGFloat) -> SideConstraint {
    var s = SideConstraint()
    s.constant = p
    return s
}

@discardableResult
public prefix func |- (v: UIView) -> UIView {
    v.left(8)
    return v
}

postfix operator -|
@discardableResult
public postfix func -| (p: CGFloat) -> SideConstraint {
    var s = SideConstraint()
    s.constant = p
    return s
}

@discardableResult
public postfix func -| (v: UIView) -> UIView {
    v.right(8)
    return v
}

public struct SideConstraint {
    var constant: CGFloat!
}

public struct PartialConstraint {
    var view1: UIView!
    var constant: CGFloat!
    var views: [UIView]?
}

@discardableResult
public func - (left: UIView, right: CGFloat) -> PartialConstraint {
    var p = PartialConstraint()
    p.view1 = left
    p.constant = right
    return p
}

// Side Constraints

@discardableResult
public func - (left: SideConstraint, right: UIView) -> UIView {
    if let spv = right.superview {
        let c = constraint(item: right, attribute: .left,
                           toItem: spv, attribute: .left,
                           constant: left.constant)
        spv.addConstraint(c)
    }
    return right
}

@discardableResult
public func - (left: [UIView], right: SideConstraint) -> [UIView] {
    let lastView = left[left.count-1]
    if let spv = lastView.superview {
        let c = constraint(item: lastView, attribute: .right,
                           toItem: spv, attribute: .right,
                           constant: -right.constant)
        spv.addConstraint(c)
    }
    return left
}

@discardableResult
public func - (left: UIView, right: SideConstraint) -> UIView {
    if let spv = left.superview {
        let c = constraint(item: left, attribute: .right,
                           toItem: spv, attribute: .right,
                           constant: -right.constant)
        spv.addConstraint(c)
    }
    return left
}

@discardableResult
public func - (left: PartialConstraint, right: UIView) -> [UIView] {
    if let views = left.views {
        if let spv = right.superview {
            let lastView = views[views.count-1]
            let c = constraint(item: lastView, attribute: .right,
                               toItem: right, attribute: .left,
                               constant: -left.constant)
            spv.addConstraint(c)
        }
        
        return  views + [right]
    } else {
        // were at the end?? nooope?/?
        if let spv = right.superview {
            let c = constraint(item: left.view1, attribute: .right,
                               toItem: right, attribute: .left,
                               constant: -left.constant)
            spv.addConstraint(c)
        }
        return  [left.view1, right]
    }
}

@discardableResult
public func - (left: UIView, right: UIView) -> [UIView] {
    if let spv = left.superview {
        let c = constraint(item: right, attribute: .left,
                           toItem: left, attribute: .right,
                           constant: 8)
        spv.addConstraint(c)
    }
    return [left, right]
}

@discardableResult
public func - (left: [UIView], right: CGFloat) -> PartialConstraint {
    var p = PartialConstraint()
    p.constant = right
    p.views = left
    return p
}

@discardableResult
public func - (left: [UIView], right: UIView) -> [UIView] {
    let lastView = left[left.count-1]
    if let spv = lastView.superview {
        let c = constraint(item: lastView, attribute: .right,
                           toItem: right, attribute: .left,
                           constant: -8)
        spv.addConstraint(c)
    }
    return left + [right]
}

//// Test space in Horizointal layout ""
public struct Space {
    var previousViews: [UIView]!
}

@discardableResult
public func - (left: UIView, right: String) -> Space {
    return Space(previousViews: [left])
}

@discardableResult
public func - (left: [UIView], right: String) -> Space {
    return Space(previousViews: left)
}

@discardableResult
public func - (left: Space, right: UIView) -> [UIView] {
    var va = left.previousViews
    va?.append(right)
    return va!
}

// MARK: - DoubleDash

infix operator -- : AdditionPrecedence

@discardableResult
public func -- (left: UIView, right: CGFloat) -> PartialConstraint {
    return left-right
}

@discardableResult
public func -- (left: SideConstraint, right: UIView) -> UIView {
    return left-right
}

@discardableResult
public func -- (left: [UIView], right: SideConstraint) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: UIView, right: SideConstraint) -> UIView {
    return left-right
}

@discardableResult
public func -- (left: PartialConstraint, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: UIView, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: [UIView], right: CGFloat) -> PartialConstraint {
    return left-right
}

@discardableResult
public func -- (left: [UIView], right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: UIView, right: String) -> Space {
    return left-right
}

@discardableResult
public func -- (left: [UIView], right: String) -> Space {
    return left-right
}

@discardableResult
public func -- (left: Space, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: UIView,
                right: JustLayoutFlexibleMargin) -> PartialFlexibleConstraint {
    return left-right
}

@discardableResult
public func -- (left: [UIView],
                right: JustLayoutFlexibleMargin) -> PartialFlexibleConstraint {
    return left-right
}

@discardableResult
public func -- (left: PartialFlexibleConstraint, right: UIView) -> [UIView] {
    return left-right
}

@discardableResult
public func -- (left: JustLayoutLeftFlexibleMargin, right: UIView) -> UIView {
    return left-right
}

@discardableResult
public func -- (left: UIView, right: JustLayoutRightFlexibleMargin) -> UIView {
    return left-right
}

@discardableResult
public func -- (left: [UIView], right: JustLayoutRightFlexibleMargin) -> [UIView] {
    return left-right
}
