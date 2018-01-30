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
//  Created by Elias Abel on 12/03/16.
//  Copyright © 2016 Elias Abel. All rights reserved.
//

import UIKit

public extension UIView {
    
    /** Gets the centerX constraint if found.
     
     Example Usage for changing centerX of a label :
     ```
     label.centerXConstraint?.constant = 10
     
     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The centerX NSLayoutConstraint if found.
     */
    public var centerXConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .centerX)
    }
    
    /** Gets the centerY constraint if found.
     
     Example Usage for changing centerY of a label :
     ```
     label.centerYConstraint?.constant = 10
     
     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The centerY NSLayoutConstraint if found.
     */
    public var centerYConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .centerY)
    }
    
    /** Gets the left constraint if found.
    
    Example Usage for changing left margin of a label :
    ```
    label.leftConstraint?.constant = 10
     
    // Animate if needed
    UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
    ```
    - Returns: The left NSLayoutConstraint if found.
     */
    public var leftConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .left)
    }

    /** Gets the right constraint if found.
     
    Example Usage for changing right margin of a label :
     
    ```
    label.rightConstraint?.constant = 10
     
    // Animate if needed
    UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
    ```
    - Returns: The right NSLayoutConstraint if found.
     */
    public var rightConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .right)
    }
        
    /** Gets the top constraint if found.
     
    Example Usage for changing top margin of a label :
     
    ```
    label.topConstraint?.constant = 10
     
    // Animate if needed
    UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
    ```
    - Returns: The top NSLayoutConstraint if found.
     */
    public var topConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .top)
    }
    
    /** Gets the bottom constraint if found.
    
    Example Usage for changing bottom margin of a label :
     
    ```
    label.bottomConstraint?.constant = 10
    
    // Animate if needed
    UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
    ```
     - Returns: The bottom NSLayoutConstraint if found.
     */
    public var bottomConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .bottom)
    }
    
    /** Gets the height constraint if found.
     
    Example Usage for changing height property of a label :
     
    ```
    label.heightConstraint?.constant = 10
     
    // Animate if needed
    UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
    ```
    - Returns: The height NSLayoutConstraint if found.
    */
    public var heightConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .height)
    }
    
    /** Gets the width constraint if found.
     
     Example Usage for changing width property of a label :
     
     ```
     label.widthConstraint?.constant = 10
     
     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The width NSLayoutConstraint if found.
     */
    public var widthConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .width)
    }
    
    /** Gets the trailing constraint if found.
     
     Example Usage for changing width property of a label :
     
     ```
     label.trailingConstraint?.constant = 10
     
     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The trailing NSLayoutConstraint if found.
     */
    public var trailingConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .trailing)
    }
    
    /** Gets the leading constraint if found.
     
     Example Usage for changing width property of a label :
     
     ```
     label.leadingConstraint?.constant = 10
     
     // Animate if needed
     UIView.animateWithDuration(0.3, animations:layoutIfNeeded)
     ```
     - Returns: The leading NSLayoutConstraint if found.
     */
    public var leadingConstraint: NSLayoutConstraint? {
        return constraintForView(self, attribute: .leading)
    }
    
}

func constraintForView(_ v: UIView, attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
    let target = v.superview ?? v
    for c in target.constraints {
        if let fi = c.firstItem as? NSObject, fi == v && c.firstAttribute == attribute {
            return c
        }
        if let si = c.secondItem as? NSObject, si == v && c.secondAttribute == attribute {
            return c
        }
    }
    return nil
}
