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

public struct JustLayoutAttribute {
    let view: UIView
    let attribute: NSLayoutAttribute
    let constant: CGFloat?
    let multiplier: CGFloat?
    
    init(view: UIView, attribute: NSLayoutAttribute) {
        self.view = view
        self.attribute = attribute
        self.constant = nil
        self.multiplier = nil
    }
    
    init(view: UIView, attribute: NSLayoutAttribute, constant: CGFloat?, multiplier: CGFloat?) {
        self.view = view
        self.attribute = attribute
        self.constant = constant
        self.multiplier = multiplier
    }
}

public extension UIView {
    
    public var widthAttribute: JustLayoutAttribute {
        return JustLayoutAttribute(view: self, attribute: .width)
    }
    
    public var heightAttribute: JustLayoutAttribute {
        return JustLayoutAttribute(view: self, attribute: .height)
    }
    
    public var topAttribute: JustLayoutAttribute {
        return JustLayoutAttribute(view: self, attribute: .top)
    }
    
    public var bottomAttribute: JustLayoutAttribute {
        return JustLayoutAttribute(view: self, attribute: .bottom)
    }
    
    public var leftAttribute: JustLayoutAttribute {
        return JustLayoutAttribute(view: self, attribute: .left)
    }
    
    public var rightAttribute: JustLayoutAttribute {
        return JustLayoutAttribute(view: self, attribute: .right)
    }
    
    public var leadingAttribute: JustLayoutAttribute {
        return JustLayoutAttribute(view: self, attribute: .leading)
    }
    
    public var crailingAttribute: JustLayoutAttribute {
        return JustLayoutAttribute(view: self, attribute: .trailing)
    }
    
    public var centerXAttribute: JustLayoutAttribute {
        return JustLayoutAttribute(view: self, attribute: .centerX)
    }
    
    public var centerYAttribute: JustLayoutAttribute {
        return JustLayoutAttribute(view: self, attribute: .centerY)
    }
}

// MARK: - Equations of type v.P == v'.P' + X

@discardableResult
public func == (left: JustLayoutAttribute, right: JustLayoutAttribute) -> NSLayoutConstraint {
    let constant = right.constant ?? 0
    let multiplier = right.multiplier ?? 1
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 toItem: right.view,
                                 attribute: right.attribute,
                                 multiplier : multiplier,
                                 constant:constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func >= (left: JustLayoutAttribute, right: JustLayoutAttribute) -> NSLayoutConstraint {
    let constant = right.constant ?? 0
    let multiplier = right.multiplier ?? 1
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .greaterThanOrEqual,
                                 toItem: right.view,
                                 attribute: right.attribute,
                                 multiplier : multiplier,
                                 constant:constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func <= (left: JustLayoutAttribute, right: JustLayoutAttribute) -> NSLayoutConstraint {
    let constant = right.constant ?? 0
    let multiplier = right.multiplier ?? 1
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .lessThanOrEqual,
                                 toItem: right.view,
                                 attribute: right.attribute,
                                 multiplier : multiplier,
                                 constant:constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func + (left: JustLayoutAttribute, right: CGFloat) -> JustLayoutAttribute {
    return JustLayoutAttribute(view: left.view, attribute: left.attribute, constant: right, multiplier: left.multiplier)
}

@discardableResult
public func - (left: JustLayoutAttribute, right: CGFloat) -> JustLayoutAttribute {
    return JustLayoutAttribute(view: left.view, attribute: left.attribute, constant: -right, multiplier: left.multiplier)
}

@discardableResult
public func * (left: JustLayoutAttribute, right: CGFloat) -> JustLayoutAttribute {
    return JustLayoutAttribute(view: left.view, attribute: left.attribute, constant:left.constant, multiplier: right)
}

@discardableResult
public func / (left: JustLayoutAttribute, right: CGFloat) -> JustLayoutAttribute {
    return left * (1/right)
}

@discardableResult
public func % (left: CGFloat, right: JustLayoutAttribute) -> JustLayoutAttribute {
    return right * (left/100)
}

// MARK: - Equations of type v.P == X

@discardableResult
public func == (left: JustLayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        var toItem: UIView? = spv
        var constant: CGFloat = right
        if left.attribute == .width || left.attribute == .height {
            toItem = nil
        }
        if left.attribute == .bottom || left.attribute == .right {
            constant = -constant
        }
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 toItem: toItem,
                                 constant:constant)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func >= (left: JustLayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .greaterThanOrEqual,
                                 toItem: spv,
                                 constant:right)
    }
    return NSLayoutConstraint()
}

@discardableResult
public func <= (left: JustLayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    if let spv = left.view.superview {
        return spv.addConstraint(item: left.view,
                                 attribute: left.attribute,
                                 relatedBy: .lessThanOrEqual,
                                 toItem: spv,
                                 constant:right)
    }
    return NSLayoutConstraint()
}
