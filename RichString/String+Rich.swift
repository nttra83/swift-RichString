//  Copyright © 2016 Stefan van den Oord. All rights reserved.

import Foundation
import UIKit

protocol NonAttributedString: RichString {
    var rich: RichString { get }
}

extension NonAttributedString {
    public func bold() -> NSAttributedString {
        return rich.bold()
    }

    public func font(_ font: UIFont) -> NSAttributedString {
        return rich.font(font)
    }

    public func fontSize(_ size: CGFloat) -> NSAttributedString {
        return rich.fontSize(size)
    }

    public func color(_ color: UIColor) -> NSAttributedString {
        return rich.color(color)
    }

    public func backgroundColor(_ color: UIColor) -> NSAttributedString {
        return rich.backgroundColor(color)
    }

    public func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> NSAttributedString {
        return rich.paragraphStyle(paragraphStyle)
    }

    public func ligature(_ ligature: Int) -> NSAttributedString {
        return rich.ligature(ligature)
    }

    public func kern(_ kern: Float) -> NSAttributedString {
        return rich.kern(kern)
    }

    public func strikeThrough(style: NSUnderlineStyle) -> NSAttributedString {
        return rich.strikeThrough(style: style)
    }

    public func underline(style: NSUnderlineStyle) -> NSAttributedString {
        return rich.underline(style: style)
    }

    public func stroke(width: Float, color: UIColor) -> NSAttributedString {
        return rich.stroke(width: width, color: color)
    }

    public func shadow(_ shadow: NSShadow) -> NSAttributedString {
        return rich.shadow(shadow)
    }

    public func letterPressed() -> NSAttributedString {
        return rich.letterPressed()
    }

    public func link(url: NSURL) -> NSAttributedString {
        return rich.link(url: url)
    }

    public func link(string: String) -> NSAttributedString {
        return rich.link(string: string)
    }
}

extension String: NonAttributedString {
    var rich: RichString {
        return NSAttributedString(string: self)
    }
}

extension NSString: NonAttributedString {
    var rich: RichString {
        return NSAttributedString(string: self as String)
    }
}
