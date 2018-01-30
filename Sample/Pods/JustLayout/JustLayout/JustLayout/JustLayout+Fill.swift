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
     Adds the constraints needed for the view to fill its `superview`.
     A padding can be used to apply equal spaces between the view and its superview
    */
    public func fill(container padding: CGFloat = 0) {
        fill(horizontally: padding)
        fill(vertically: padding)
    }
    
    /**
     Adds the constraints needed for the view to fill its `superview` Vertically.
     A padding can be used to apply equal spaces between the view and its superview
     */
    @discardableResult
    public func fill(vertically points: CGFloat = 0) -> Self {
        return fill(.vertical, points: points)
    }
    
    /**
     Adds the constraints needed for the view to fill its `superview` Horizontally.
     A padding can be used to apply equal spaces between the view and its superview
     */
    @discardableResult
    public func fill(horizontally points: CGFloat = 0) -> Self {
        return fill(.horizontal, points: points)
    }
    
    fileprivate func fill(_ axis: UILayoutConstraintAxis, points: CGFloat = 0) -> Self {
        let a: NSLayoutAttribute = axis == .vertical ? .top : .left
        let b: NSLayoutAttribute = axis == .vertical ? .bottom : .right
        if let spv = superview {
            let c1 = constraint(item: self, attribute: a, toItem: spv, constant: points)
            let c2 = constraint(item: self, attribute: b, toItem: spv, constant: -points)
            spv.addConstraints([c1, c2])
        }
        return self
    }
}
