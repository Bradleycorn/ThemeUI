#if os(iOS)
import Foundation
import SwiftUI

/// Defines a Theme for an Application.
///
/// A theme consists of a set of semantically named colors, typography, and shapes
/// that an app can apply to it's UI to ensure consistent design throughout.
///
/// ### Usage
/// Typically you will not create an `AppTheme` instance yourself. Instead you will
/// use a ``ThemedView`` to setup theming for your app. The ``ThemedView``
/// will create and expose an `AppTheme` Environment Object that you can consume in your
/// app's views to apply theming.
///
/// ### Color Modes
/// There are two ways to support light/dark modes in your app using `AppTheme`.
///
/// If your colors are defined in an Asset Catalog, and you set light/dark mode variants there,
/// then a single `AppTheme` instance can be used and it's ``colorScheme`` will provide
/// colors that "automatically" switch between light and dark modes.
///
/// If you define your colors in code, then the ``colorScheme`` will provide a single set
/// of colors, regardless of the device's light/dark mode setting. If you want to handle light
/// and dark mode in your app, it's easy to create two `AppTheme` instances (one for each mode,
/// and each with a set of colors that apply to that mode), and you can apply the appropriate
/// theme to your app using the SwiftUI `ColorScheme` environment variable.
public class AppTheme: ObservableObject {
    
    /// A ``Colors`` instance that exposes the set of colors used by this theme.
    public let colorScheme: Colors
    
    /// A ``Typography`` instane that exposes the set of type faces used by this theme.
    public let typography: Typography
    
    /// A ``Shapes`` instance that exposes the set of shapes used by this theme.
    public let shapes: Shapes

    /// Creates an ``AppTheme`` instance from the provided colors, typography, and shapes.
    ///
    /// - Parameters:
    ///   - colors: The set of ``Colors`` for this theme to use.
    ///   - typography: The set of ``Typography`` for this theme to use.
    ///   - shapes: The set of ``Shapes`` for this theme to use.
    init(_ colors: Colors, _ typography: Typography, _ shapes: Shapes) {
        self.colorScheme = colors
        self.typography = typography
        self.shapes = shapes
    }
    
}
#endif
