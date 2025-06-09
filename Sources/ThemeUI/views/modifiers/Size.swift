import Foundation
import SwiftUI

import SwiftUI

/// A View Modifier that sets the frame of a view with equal width and height values.
public struct Size: ViewModifier {

    /// The size of the frame. This value applies to both the frame's width and height.
    let size: CGFloat?
    
    /// The `Alignment` of content in the frame.
    let alignment: Alignment
    
    /// Create a `Size` instance.
    ///
    /// - Parameters:
    ///   - size: The size to use for the frame that is applied to the view.
    ///   This value applies to both the frame's width and height.
    ///   - alignment: The `Aligment` to be applied to the frame, which will
    ///   affect the alignment of the view's content within the frame. Defaults to `.center`.
    public init(_ size: CGFloat?, alignment: Alignment = .center) {
        self.size = size
        self.alignment = alignment
    }
    
    /// Apply the frame modifier, setting the size and alignment.
    public func body(content: Content) -> some View {
        content.frame(width: size, height: size, alignment: alignment)
    }
}

extension View {
    /// Apply a frame to the view, using an equal size for the frame's width and height.
    ///
    /// - Parameters:
    ///   - size: The size to use for the frame that is applied to the view.
    ///   This value will be applied to both the frame's width and height.
    ///   - alignment: The `Aligment` to be applied to the frame, which will
    ///   affect the alignment of the view's content within the frame. Defaults to `.center`.
    public func size(_ size: CGFloat, alignment: Alignment = .center) -> some View {
        modifier(Size(size, alignment: alignment))
    }
}

