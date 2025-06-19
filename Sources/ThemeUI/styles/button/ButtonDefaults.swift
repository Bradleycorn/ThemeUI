import Foundation
import SwiftUI

/// A set of default properties for rendering Buttons with one of ThemeUI's provided Button Styles.
///
/// Buttons are a key visual and functional component in almost every app.
/// Displaying buttons consistently is one of the primary ways that we implement
/// design and theming in apps. `ButtonDefaults` provides a set of properties
/// that are used to provide default/consistent styling to buttons when using one
/// of ThemeUI's Button Styles (like ``FilledButtonStyle``, ``OutlinedButtonStyle`` or ``TextButtonStyle``).
///
/// When building an app, we don't want to have to re-apply padding, colors, outlines, shapes, etc on every button that is displayed.
/// The ButtonDefaults class provides a place to centralize the default values for buttons, so that they can be applied easily and consistently.
public class ButtonDefaults {
    
    /// A set of `EdgeInsets` to provide padding between button text and it's fill/border space.
    public static var padding: EdgeInsets {
        EdgeInsets(horizontal: 16, vertical: 8)
    }
    
    /// A set of ``ButtonColors`` to apply to buttons with a filled background color.
    ///
    /// When presenting buttons using the ``FilledButtonStyle`` or ``TextButtonStyle``,
    /// this property provides a set of colors from your ``AppTheme/colorScheme`` to use by default.
    ///
    /// - Parameters:
    ///   - colorScheme: The current ``ColorScheme`` applyed by your ``AppTheme``.
    /// - Returns: A set of ``ButtonColors`` to be applied to buttons.
    public static func colors(from colorScheme: ColorScheme) -> ButtonColors {
        return colorScheme.deaultButtonColors
    }
    
    /// A set of ``ButtonColors`` to apply to buttons with a transparent background and an outline/border.
    ///
    /// When presenting buttons using the ``OutlinedButtonStyle``,
    /// this property provides a set of colors from your ``AppTheme/colorScheme`` to use by default
    /// for the button's text content and border.
    ///
    /// - Parameters:
    ///   - colorScheme: The current ``ColorScheme`` applyed by your ``AppTheme``.
    /// - Returns: A set of ``ButtonColors`` to be applied to an Outlined button's text and border.
    public static func outlinedColors(from colorScheme: ColorScheme) -> ButtonColors {
        return colorScheme.outlinedButtonColors
    }

    
    /// A set of ``ButtonColors`` to apply to text only buttons with no background or other visual elements like borders.
    ///
    /// When presenting buttons using the ``TextButtonStyle``,
    /// this property provides a set of colors from your ``AppTheme/colorScheme`` to use by default
    /// for the button's text content.
    ///
    /// - Parameters:
    ///   - colorScheme: The current ``ColorScheme`` applyed by your ``AppTheme``.
    /// - Returns: A set of ``ButtonColors`` to be applied to an Text button's text.
    public static func textColors(from colorScheme: ColorScheme) -> ButtonColors {
        return colorScheme.textButtonColors
    }

    /// A default border width to apply to buttons that use an ``OutlinedButtonStyle``.
    public static let outlinedButtonBorderWidth: CGFloat = 1
    
    /// A sdefault hape to apply to ``FilledButtonStyle`` and ``OutlinedButtonStyle`` buttons.
    public static let shape: some Shape = .capsule
}
