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
    
     Lays out the views on both axis.
     
     Note that this is not needed for Horizontal only layouts.
     
     `layout` is primarily for laying out views vertically but horizontal statements 
     are supported, making it perfect for describing a layout in one single statement.
     
     ```
     layout(
         100,
         |-email-| ~ 80,
         8,
         |-password-forgot-| ~ 80,
         >=20,
         |login| ~ 80,
         0
     )
     ```
     */
    @discardableResult
    public func layout(_ objects: Any...) -> [UIView] {
        return stack(vertically: objects)
    }
    
    @discardableResult
    fileprivate func stack(vertically objects: [Any]) -> [UIView] {
        var previousMargin: CGFloat? = nil
        var previousFlexibleMargin: JustLayoutFlexibleMargin? = nil
        
        for (i, o) in objects.enumerated() {
            
            switch o {
            case let v as UIView:
                if let pm = previousMargin {
                    if i == 1 {
                        v.top(pm) // only if first view
                    } else {
                        if let vx = objects[i-2] as? UIView {
                            vx.stack(vertically:pm, view: v)
                        } else if let va = objects[i-2] as? [UIView] {
                            va.first!.stack(vertically: pm, view: v)
                        }
                    }
                    previousMargin = nil
                } else if let pfm = previousFlexibleMargin {
                    if i == 1 {
                        v.top(pfm) // only if first view
                    } else {
                        if let vx = objects[i-2] as? UIView {
                            addConstraint(
                                item: v, attribute: .top,
                                relatedBy: pfm.relation,
                                toItem: vx, attribute: .bottom,
                                multiplier: 1, constant: pfm.points
                            )
                        } else if let va = objects[i-2] as? [UIView] {
                            addConstraint(
                                item: v, attribute: .top,
                                relatedBy: pfm.relation,
                                toItem: va.first!, attribute: .bottom,
                                multiplier: 1, constant: pfm.points
                            )
                        }
                    }
                    previousFlexibleMargin = nil
                } else {
                    tryStackViewVerticallyWithPreviousView(v, index: i, objects: objects)
                }
            case is Int: fallthrough
            case is Double: fallthrough
            case is CGFloat:
                let m = cgFloatMarginFromObject(o)
                previousMargin = m // Store margin for next pass
                if i != 0 && i == (objects.count - 1) {
                    //Last Margin, Bottom
                    if let previousView = objects[i-1] as? UIView {
                        previousView.bottom(m)
                    } else if let va = objects[i-1] as? [UIView] {
                        va.first!.bottom(m)
                    }
                }
            case let fm as JustLayoutFlexibleMargin:
                previousFlexibleMargin = fm // Store margin for next pass
                if i != 0 && i == (objects.count - 1) {
                    //Last Margin, Bottom
                    if let previousView = objects[i-1] as? UIView {
                        previousView.bottom(fm)
                    } else if let va = objects[i-1] as? [UIView] {
                        va.first!.bottom(fm)
                    }
                }
            case _ as String:() //Do nothin' !
            case let a as [UIView]:
                align(horizontally: a)
            let v = a.first!
            if let pm = previousMargin {
                if i == 1 {
                    v.top(pm) // only if first view
                } else {
                    if let vx = objects[i-2] as? UIView {
                        vx.stack(vertically: pm, view: v)
                    } else if let va = objects[i-2] as? [UIView] {
                        va.first!.stack(vertically: pm, view: v)
                    }
                }
                previousMargin = nil
            } else if let pfm = previousFlexibleMargin {
                if i == 1 {
                    v.top(pfm) // only if first view
                } else {
                    if let vx = objects[i-2] as? UIView {
                        addConstraint(
                            item: v, attribute: .top,
                            relatedBy: pfm.relation,
                            toItem: vx, attribute: .bottom,
                            multiplier: 1, constant: pfm.points
                        )
                    } else if let va = objects[i-2] as? [UIView] {
                        addConstraint(
                            item: v, attribute: .top,
                            relatedBy: pfm.relation,
                            toItem: va.first!, attribute: .bottom,
                            multiplier: 1, constant: pfm.points
                        )
                    }
                }
                previousFlexibleMargin = nil
            } else {
                tryStackViewVerticallyWithPreviousView(v, index: i, objects: objects)
            }
            default: ()
            }
        }
        return objects.map {$0 as? UIView }.flatMap {$0}
    }
    
    fileprivate func cgFloatMarginFromObject(_ o: Any) -> CGFloat {
        var m: CGFloat = 0
        if let i = o as? Int {
            m = CGFloat(i)
        } else if let d = o as? Double {
            m = CGFloat(d)
        } else if let cg = o as? CGFloat {
            m = cg
        }
        return m
    }
    
    fileprivate func tryStackViewVerticallyWithPreviousView(_ view: UIView,
                                                            index: Int, objects: [Any]) {
        if let pv = previousViewFromIndex(index, objects: objects) {
            pv.stack(vertically: 0, view: view)
        }
    }
    
    fileprivate func previousViewFromIndex(_ index: Int, objects: [Any]) -> UIView? {
        if index != 0 {
            if let previousView = objects[index-1] as? UIView {
                return previousView
            }
        }
        return nil
    }
    
    @discardableResult
    fileprivate func stack<T>(vertically points: CGFloat, view v: T) -> T where T: UIView {
        return stack(.vertical, points: points, v: v)
    }
    
    @discardableResult
    fileprivate func stack<T>(_ axis: UILayoutConstraintAxis,
                         points: CGFloat = 0, v: T) -> T where T: UIView {
        let a: NSLayoutAttribute = axis == .vertical ? .top : .left
        let b: NSLayoutAttribute = axis == .vertical ? .bottom : .right
        if let spv = superview {
            let c = constraint(item: v, attribute: a, toItem: self, attribute: b, constant: points)
            spv.addConstraint(c)
        }
        return v
    }
}
