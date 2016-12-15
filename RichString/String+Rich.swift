//  Copyright © 2016 Stefan van den Oord. All rights reserved.

import Foundation

#if SWIFT_PACKAGE || os(macOS)
    import AppKit
#else
    import UIKit
#endif

/**
 * Protocol used to add all functionality to both `String` and `NSString`.
 * You normally don't need to use this directly yourself.
 *
 * Please note: I would have preferred for this protocol to be internal.
 * That doesn't work with Swift 3 however; when doing release builds you
 * get 'undefined symbol' linker errors. More info:
 * https://bugs.swift.org/browse/SR-2925
 */
public protocol NonAttributedString: RichString {
    /**
     * Create a `NSAttributedString` version of the string. Should be internal, not public;
     * see remark above.
     *
     * - Returns: `NSAttributedString` version of this string. 
     */
    var rich: RichString { get }
}

/**
 * Protocol used to add all functionality to both `String` and `NSString`.
 * You normally don't need to use this protocol directly yourself.
 */
extension NonAttributedString {
    public func font(_ font: Font) -> NSAttributedString {
        return rich.font(font)
    }

    public func color(_ color: Color) -> NSAttributedString {
        return rich.color(color)
    }

    public func backgroundColor(_ color: Color) -> NSAttributedString {
        return rich.backgroundColor(color)
    }

    public func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> NSAttributedString {
        return rich.paragraphStyle(paragraphStyle)
    }

    public func paragraphStyle(configure: (NSMutableParagraphStyle) -> Void)
            -> NSAttributedString {
        return rich.paragraphStyle(configure: configure)
    }

    public func ligature(_ ligature: Bool) -> NSAttributedString {
        return rich.ligature(ligature)
    }

    public func kern(_ kern: Float) -> NSAttributedString {
        return rich.kern(kern)
    }

    public func strikeThrough(style: NSUnderlineStyle) -> NSAttributedString {
        return rich.strikeThrough(style: style)
    }

    public func strikeThrough(color: Color) -> NSAttributedString {
        return rich.strikeThrough(color: color)
    }

    public func strikeThrough(color: Color, style: NSUnderlineStyle) -> NSAttributedString {
        return rich.strikeThrough(color: color, style: style)
    }

    public func underline(style: NSUnderlineStyle) -> NSAttributedString {
        return rich.underline(style: style)
    }

    public func underline(color: Color) -> NSAttributedString {
        return rich.underline(color: color)
    }

    public func underline(color: Color, style: NSUnderlineStyle)
            -> NSAttributedString {
        return rich.underline(color: color, style: style)
    }

    public func stroke(width: Float, color: Color) -> NSAttributedString {
        return rich.stroke(width: width, color: color)
    }

    #if !os(watchOS)

        public func shadow(_ shadow: NSShadow) -> NSAttributedString {
            return rich.shadow(shadow)
        }

        public func shadow(configure: (NSShadow) -> Void) -> NSAttributedString {
            return rich.shadow(configure: configure)
        }

        public func attachment(configure: (NSTextAttachment) -> Void)
            -> NSAttributedString {
                return rich.attachment(configure: configure)
        }

    #endif

    public func letterPressed() -> NSAttributedString {
        return rich.letterPressed()
    }

    public func link(url: NSURL) -> NSAttributedString {
        return rich.link(url: url)
    }

    public func link(string: String) -> NSAttributedString {
        return rich.link(string: string)
    }

    public func baselineOffset(_ offset: Float) -> NSAttributedString {
        return rich.baselineOffset(offset)
    }

    public func obliqueness(_ obliqueness: Float) -> NSAttributedString {
        return rich.obliqueness(obliqueness)
    }

    public func expansion(_ expansion: Float) -> NSAttributedString {
        return rich.expansion(expansion)
    }
}

extension String: NonAttributedString {
    public var rich: RichString {
        return NSAttributedString(string: self)
    }
}

extension NSString: NonAttributedString {
    public var rich: RichString {
        return NSAttributedString(string: self as String)
    }
}
