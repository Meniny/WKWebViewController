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

public extension UIView {
    
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     
     
     ```
     class MyView: UIView {
     
     let email = UITextField()
     let password = UITextField()
     let login = UIButton()
     
        convenience init() {
        self.init(frame: CGRect.zero)
     
         sv(
            email,
            password,
            login
         )
        ...
     
        }
     }
     
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @discardableResult
    public func translates(subViews svs: UIView...) -> UIView {
        return translates(subViews: svs)
    }

    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     
     ```
     class MyView: UIView {
     
     let email = UITextField()
     let password = UITextField()
     let login = UIButton()
     
         convenience init() {
         self.init(frame: CGRect.zero)
         
         sv(
            email,
            password,
            login
         )
     ...
     
     }
     }
     
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @objc @discardableResult
    public func translates(subViews svs: [UIView]) -> UIView {
        for sv in svs {
            if !subviews.contains(sv) {
                addSubview(sv)
            }
            sv.translatesAutoresizingMaskIntoConstraints = false
        }
        return self
    }
}

public extension UITableViewCell {
    
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `contentView.addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     ```
     class NotificationCell: UITableViewCell {
    
        var avatar = UIImageView()
        var name = UILabel()
        var followButton = UIButton()
     
         required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
         override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier) {
     
             sv(
                avatar,
                name,
                followButton
            )
        ...
     
        }
     }
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @discardableResult
    public override func translates(subViews svs: [UIView]) -> UIView {
        return contentView.translates(subViews: svs)
    }
}

public extension UICollectionViewCell {
    /**
     Defines the view hierachy for the view.
     
     Esentially, this is just a shortcut to `contentView.addSubview`
     and 'translatesAutoresizingMaskIntoConstraints = false'
     
     ```
     class PhotoCollectionViewCell: UICollectionViewCell {
     
     var avatar = UIImageView()
     var name = UILabel()
     var followButton = UIButton()
     
     
     required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
     override init(frame: CGRect) {
     super.init(frame: frame)
     
         sv(
            avatar,
            name,
            followButton
         )
     ...
     
     }
     }
     ```
     
     - Returns: Itself to enable nested layouts.
     */
    @discardableResult
    public override func translates(subViews svs: [UIView]) -> UIView {
        return contentView.translates(subViews: svs)
    }
}
