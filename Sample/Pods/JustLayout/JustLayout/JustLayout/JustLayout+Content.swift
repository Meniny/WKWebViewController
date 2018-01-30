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

public extension UIButton {
    
    /**
     Sets the title of the button for normal State
     
     Essentially a shortcut for `setTitle("MyText", forState: .Normal)`
     
     - Returns: Itself for chaining purposes
    */
    @discardableResult
    public func text(_ t: String) -> Self {
        setTitle(t, for: .normal)
        return self
    }
    
    /**
     Sets the localized key for the button's title in normal State
     
     Essentially a shortcut for `setTitle(NSLocalizedString("MyText", comment: "")
     , forState: .Normal)`
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func text(key t: String) -> Self {
        text(NSLocalizedString(t, comment: ""))
        return self
    }
    
    /**
     Sets the image of the button in normal State
     
     Essentially a shortcut for `setImage(UIImage(named:"X"), forState: .Normal)`
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func image(_ s: String) -> Self {
        setImage(UIImage(named:s), for: .normal)
        return self
    }
}

public extension UITextField {
    /**
     Sets the textfield placeholder but in a chainable fashion
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func placeholder(_ t: String) -> Self {
        placeholder = t
        return self
    }
}

public extension UILabel {
    /**
     Sets the label text but in a chainable fashion
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func text(_ t: String) -> Self {
        text = t
        return self
    }
    
    /**
     Sets the label localization key but in a chainable fashion
     Essentially a shortcut for `text = NSLocalizedString("X", comment: "")`
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func text(key t: String) -> Self {
        text(NSLocalizedString(t, comment: ""))
        return self
    }
}

extension UIImageView {
    /**
     Sets the image of the imageView but in a chainable fashion
     
     Essentially a shortcut for `image = UIImage(named: "X")`
     
     - Returns: Itself for chaining purposes
     */
    @discardableResult
    public func image(_ t: String) -> Self {
        image = UIImage(named: t)
        return self
    }
}
