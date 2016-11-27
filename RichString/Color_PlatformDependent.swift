//  Copyright © 2016 Stefan van den Oord. All rights reserved.

#if os(iOS) || os(watchOS) || os(tvOS)

    import UIKit

    public typealias Color = UIColor

#elseif os(macOS)

    import AppKit

    public typealias Color = NSColor

#endif
