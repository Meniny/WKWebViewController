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
//  Created by Sacha DSO on 09/10/2017.
//  Copyright © 2017 Elias Abel. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
public struct JustLayoutYAxisAnchor {
    let anchor: NSLayoutYAxisAnchor
    let constant: CGFloat
    
    init(anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        self.anchor = anchor
        self.constant = constant
    }
}

@available(iOS 9.0, *)
public struct JustLayoutXAxisAnchor {
    let anchor: NSLayoutXAxisAnchor
    let constant: CGFloat
    
    init(anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        self.anchor = anchor
        self.constant = constant
    }
}

@available(iOS 9.0, *)
public extension UILayoutGuide {

    public var Top: JustLayoutYAxisAnchor {
        return JustLayoutYAxisAnchor(anchor: topAnchor)
    }

    public var Bottom: JustLayoutYAxisAnchor {
        return JustLayoutYAxisAnchor(anchor: bottomAnchor)
    }
    
    public var Left: JustLayoutXAxisAnchor {
        return JustLayoutXAxisAnchor(anchor: leftAnchor)
    }
    
    public var Right: JustLayoutXAxisAnchor {
        return JustLayoutXAxisAnchor(anchor: rightAnchor)
    }
    
    public var Leading: JustLayoutXAxisAnchor {
        return JustLayoutXAxisAnchor(anchor: leadingAnchor)
    }
    
    public var Trailing: JustLayoutXAxisAnchor {
        return JustLayoutXAxisAnchor(anchor: trailingAnchor)
    }

    public var CenterX: JustLayoutXAxisAnchor {
        return JustLayoutXAxisAnchor(anchor: centerXAnchor)
    }
    
    public var CenterY: JustLayoutYAxisAnchor {
        return JustLayoutYAxisAnchor(anchor: centerYAnchor)
    }
}

@available(iOS 9.0, *)
@discardableResult
public func == (left: JustLayoutAttribute, right: JustLayoutYAxisAnchor) -> NSLayoutConstraint {
    
    var constraint = NSLayoutConstraint()
    
    if left.attribute == .top {
        constraint = left.view.topAnchor.constraint(equalTo: right.anchor, constant: right.constant)
    }
    
    if left.attribute == .bottom {
        constraint = left.view.bottomAnchor.constraint(equalTo: right.anchor, constant: right.constant)
    }
    
    constraint.isActive = true
    return constraint
}

@available(iOS 9.0, *)
@discardableResult
public func == (left: JustLayoutAttribute, right: JustLayoutXAxisAnchor) -> NSLayoutConstraint {
    
    var constraint = NSLayoutConstraint()
    
    if left.attribute == .left {
        constraint = left.view.leftAnchor.constraint(equalTo: right.anchor, constant: right.constant)
    }
    
    if left.attribute == .right {
        constraint = left.view.rightAnchor.constraint(equalTo: right.anchor, constant: right.constant)
    }
    
    if left.attribute == .leading {
        constraint = left.view.leadingAnchor.constraint(equalTo: right.anchor, constant: right.constant)
    }
    
    if left.attribute == .trailing {
        constraint = left.view.trailingAnchor.constraint(equalTo: right.anchor, constant: right.constant)
    }
    
    constraint.isActive = true
    return constraint
}

// JustLayoutYAxisAnchor

@available(iOS 9.0, *)
@discardableResult
public func + (left: JustLayoutYAxisAnchor, right: CGFloat) -> JustLayoutYAxisAnchor {
    return JustLayoutYAxisAnchor(anchor: left.anchor, constant: right)
}

@available(iOS 9.0, *)
@discardableResult
public func - (left: JustLayoutYAxisAnchor, right: CGFloat) -> JustLayoutYAxisAnchor {
    return JustLayoutYAxisAnchor(anchor: left.anchor, constant: -right)
}

@available(iOS 9.0, *)
@discardableResult
public func + (left: JustLayoutXAxisAnchor, right: CGFloat) -> JustLayoutXAxisAnchor {
    return JustLayoutXAxisAnchor(anchor: left.anchor, constant: right)
}

@available(iOS 9.0, *)
@discardableResult
public func - (left: JustLayoutXAxisAnchor, right: CGFloat) -> JustLayoutXAxisAnchor {
    return JustLayoutXAxisAnchor(anchor: left.anchor, constant: -right)
}

// UILayoutSupport

@available(iOS 9.0, *)
public extension UILayoutSupport {
    
    public var Top: JustLayoutYAxisAnchor {
        return JustLayoutYAxisAnchor(anchor: topAnchor)
    }
    
    public var Bottom: JustLayoutYAxisAnchor {
        return JustLayoutYAxisAnchor(anchor: bottomAnchor)
    }
}
