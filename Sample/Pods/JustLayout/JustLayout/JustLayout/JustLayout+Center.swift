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
     Centers the view in its container.
     
     ```
     button.centerInContainer()
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    public func centerInContainer() -> Self {
        if let spv = superview {
            align(center: self, with: spv)
        }
        return self
    }
    
    /**
     Centers the view horizontally (X axis) in its container.
     
     ```
     button.centerHorizontally()
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    public func centerHorizontally() -> Self {
        if let spv = superview {
            align(vertically: self, spv)
        }
        return self
    }
    
    /**
     Centers the view vertically (Y axis) in its container.
     
     ```
     button.centerVertically()
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    public func centerVertically() -> Self {
        if let spv = superview {
            align(horizontally: self, spv)
        }
        return self
    }
    
    /**
     Centers the view horizontally (X axis) in its container, with an offset
     
     ```
     button.centerHorizontally(40)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    public func centerHorizontally(_ offset: CGFloat) -> Self {
        if let spv = superview {
            align(vertically: self, with: spv, offset: offset)
        }
        return self
    }
    
    /**
     Centers the view vertically (Y axis) in its container, with an offset
     
     ```
     button.centerVertically(40)
     ```
     
     - Returns: Itself, enabling chaining,
     
     */
    @discardableResult
    public func centerVertically(_ offset: CGFloat) -> Self {
        if let spv = superview {
            align(horizontally: self, with: spv, offset: offset)
        }
        return self
    }
}
