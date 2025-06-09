#if os(iOS)
import Foundation
import SwiftUI
/// A set of semantically named Shapes to be applied by an ``AppTheme``
///
/// By default,  views are rendered as a rectangular area on the screen.
/// SwiftUI provides a number of modifiers that use `Shape` instances to change the way a
/// view is rendered. The `clipShape` and `overlay` modifiers are a few commonly used
/// modifiers that work with a `Shape` to change the rendering of a view. The `Shapes` class
/// provides a consistent and semantic way to define a set of shapes to apply to your app's
/// views.
///
/// The class provides several "sizes" (small, medium, large, etc) that you can apply to the
/// views in your app to ensure consistency. Note that the "sizes" are in reference to the
/// size of the _view_ the shape is being applied to, and NOT the size of the shape itself.
/// For example, if you are defining shapes using `RoundedRectangle`, the `small`,
/// `medium`, and `large` properties are not in reference to the amount of rounding. It
/// is entirely acceptable to use a large rounding value for "small" shapes, and a smaller value
/// for "large" shapes if your design/theme call for that.  The shape properties instead reference
/// the size of the view they are applied to. Use the "small" shape for small views (like chips or icons),
/// and use the large shape for large views (like content cards or modals).
///
/// ## Detailed Information
/// For more information, see the <doc:Shape> documenation.
///
public class Shapes: ObservableObject {
    
    /// A shape to be applied to small views like chips or icons.
    @Published public private(set) var small: AnyShape
    
    /// A shape to be applied to medium views like buttons or cards.
    @Published public private(set) var medium: AnyShape
    
    /// A shaped to be applied to large views like bottom sheets or dialogs.
    @Published public private(set) var large: AnyShape
    
    
    /// Create a new `Shapes` instance.
    ///
    /// Creates a new `Shapes` instance with the passed in values.
    ///
    /// - Parameters:
    ///   - small: A `Shape` to use for small size views. Defaults to a Rounded Rectangle with a small amount of rounding.
    ///   - medium: A `Shape` to use for medium size views. Defaults to a Rounded Rectangle with a fair amount of rounding.
    ///   - large: A `Shape` to use for large size views. Defaults to a Rounded Rectangle with more rounding.
    public init(
        small: some Shape = RoundedRectangle(cornerRadius: 8),
        medium: some Shape = RoundedRectangle(cornerRadius: 10),
        large: some Shape = RoundedRectangle(cornerRadius: 12)) {

            self.small = AnyShape(small)
            self.medium = AnyShape(medium)
            self.large = AnyShape(large)
    }
}
#endif
