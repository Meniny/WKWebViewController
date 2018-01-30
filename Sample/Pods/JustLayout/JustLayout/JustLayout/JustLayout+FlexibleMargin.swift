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
//  Created by Elias Abel on 10/07/16.
//  Copyright © 2016 Elias Abel. All rights reserved.
//

import UIKit

prefix operator >=
@discardableResult
public prefix func >= (p: CGFloat) -> JustLayoutFlexibleMargin {
    return JustLayoutFlexibleMargin(points: p, relation: .greaterThanOrEqual)
}

prefix operator <=
@discardableResult
public prefix func <= (p: CGFloat) -> JustLayoutFlexibleMargin {
    return JustLayoutFlexibleMargin(points: p, relation: .lessThanOrEqual)
}

public struct JustLayoutFlexibleMargin {
    var points: CGFloat!
    var relation: NSLayoutRelation!
}

public struct PartialFlexibleConstraint {
    var fm: JustLayoutFlexibleMargin!
    var view1: UIView?
    var views: [UIView]?
}

@discardableResult
public func - (left: UIView,
               right: JustLayoutFlexibleMargin) -> PartialFlexibleConstraint {
    return PartialFlexibleConstraint(fm: right, view1: left, views: nil)
}

@discardableResult
public func - (left: [UIView],
               right: JustLayoutFlexibleMargin) -> PartialFlexibleConstraint {
    return PartialFlexibleConstraint(fm: right, view1: nil, views: left)
}

@discardableResult
public func - (left: PartialFlexibleConstraint, right: UIView) -> [UIView] {
    if let views = left.views {
        if let spv = right.superview {
            let c = constraint(item: right, attribute: .left,
                               relatedBy:left.fm.relation, toItem: views.last,
                               attribute: .right,
                               constant: left.fm.points)
            spv.addConstraint(c)
        }
        return views + [right]
    } else {
        if let spv = right.superview {
            let c = constraint(item: right, attribute: .left,
                               relatedBy:left.fm.relation, toItem: left.view1!,
                               attribute: .right,
                               constant: left.fm.points)
            spv.addConstraint(c)
        }
        return [left.view1!, right]
    }
}

// Left Flexible margin

public struct JustLayoutLeftFlexibleMargin {
    let fm: JustLayoutFlexibleMargin
}

@discardableResult
public prefix func |- (fm: JustLayoutFlexibleMargin) -> JustLayoutLeftFlexibleMargin {
    return JustLayoutLeftFlexibleMargin(fm: fm)
}

@discardableResult
public func - (left: JustLayoutLeftFlexibleMargin, right: UIView) -> UIView {
    if let spv = right.superview {
        let c = constraint(item: right, attribute: .left,
                           relatedBy:left.fm.relation, toItem: spv,
                           attribute: .left,
                           constant: left.fm.points)
        spv.addConstraint(c)
    }
    return right
}

// Right Flexible margin

public struct JustLayoutRightFlexibleMargin {
    let fm: JustLayoutFlexibleMargin
}

@discardableResult
public postfix func -| (fm: JustLayoutFlexibleMargin) -> JustLayoutRightFlexibleMargin {
    return JustLayoutRightFlexibleMargin(fm: fm)
}

@discardableResult
public func - (left: UIView, right: JustLayoutRightFlexibleMargin) -> UIView {
    if let spv = left.superview {
        let c = constraint(item: spv, attribute: .right,
                           relatedBy:right.fm.relation, toItem: left,
                           attribute: .right,
                           constant: right.fm.points)
        spv.addConstraint(c)
    }
    return left
}

@discardableResult
public func - (left: [UIView], right: JustLayoutRightFlexibleMargin) -> [UIView] {
    if let spv = left.last!.superview {
        let c = constraint(item: spv, attribute: .right,
                           relatedBy:right.fm.relation,
                           toItem: left.last!,
                           attribute: .right,
                           constant: right.fm.points)
        spv.addConstraint(c)
    }
    return left
}
