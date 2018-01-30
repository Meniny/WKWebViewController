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

public typealias UIButtonActionClosure = (_ button: UIButton) -> Void

public class UIButtonClosureWrapper {
    var closure: UIButtonActionClosure?
    
    init(_ closure: UIButtonActionClosure?) {
        self.closure = closure
    }
}

private var kButtonActionClosureAssociationKey: UInt8 = 0

public extension UIButton {
    
    internal var buttonClosure: UIButtonActionClosure? {
        get {
            if let wrapper = objc_getAssociatedObject(self, &kButtonActionClosureAssociationKey) as? UIButtonClosureWrapper {
                return wrapper.closure
            }
            return nil
        }
        set(newValue) {
            objc_setAssociatedObject(self, &kButtonActionClosureAssociationKey,
                                     UIButtonClosureWrapper(newValue),
                                     objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    public func tap(_ event: UIControlEvents = .touchUpInside, action: UIButtonActionClosure?) -> Self {
        #if swift(>=2.2)
            self.addTarget(self, action: #selector(self.tapped), for: .touchUpInside)
        #else
            self.addTarget(self, action: "tapped", forControlEvents: .TouchUpInside)
        #endif
        self.buttonClosure = action
        return self
    }
    
    /** */
    @objc func tapped() {
        self.buttonClosure?(self)
    }
}
