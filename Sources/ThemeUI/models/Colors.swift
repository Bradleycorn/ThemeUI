#if os(iOS)
import Foundation
import SwiftUI


/// A set of semantically named colors to be applied by an ``AppTheme``.
///
/// ## Detailed Documentation
/// For detailed documentation on the semantic color palette, see the
/// <doc:Color#Understanding-the-Color-Palette> documentation.
///
/// ## Overview
/// Each color in your app serves a distinct purpose and should be used
/// consistently in your app. The `Colors` struct provides
/// a semantically named color palette that your app can use to enforce
/// the consistent and purposeful use of color.
///
/// You can create a `Colors` instance directly by providing color
/// values for all properties. Alternatively, convenience methods
/// are provided with a sane set of defaults, allowing you to
/// customize only the colors that are specific and relevant to your
/// app. See the <doc:Color#Creating-a-Color-Palette> documentation
/// for more information.
public struct Colors {
    
    /// Your primary brand color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let primary: Color
    
    /// Color for content rendered ON TOP OF your primary brand color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let onPrimary: Color
    
    /// Background color for primary/important highlighted content.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let primaryContainer: Color
    
    /// Color for content rendered ON TOP OF your primary container color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let onPrimaryContainer: Color
    
    /// Your secondary brand color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let secondary: Color
    
    /// Color for content rendered ON TOP OF your secondary brand color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let onSecondary: Color
    
    
    /// Background color for secondary highlighted content.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let secondaryContainer: Color

    /// Color for content rendered ON TOP OF your secondary container color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let onSecondaryContainer: Color

    /// Your tertiary brand color, or a color for lesser/alternative content.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let tertiary: Color

    /// Color for content rendered ON TOP OF your tertiary brand color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let onTertiary: Color

    /// Background color for tertiary content.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let tertiaryContainer: Color

    ///Color for content rendered ON TOP OF your terticary container color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let onTertiaryContainer: Color
    
    /// Primary background color for screens and other standard content containers.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let surface: Color
    
    
    /// An alternative/darker surface background color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let surfaceDim: Color


    /// Abn alternative/lighter surface background color.
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let surfaceBright: Color

    /// An alternative surface background color for content containers.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let surfaceContainer: Color

    
    /// The primary content color.  Used for content rendered ON TOP OF a surface.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let onSurface: Color

    ///An "opposite" color for surfaces/backgrounds.
    ///
    /// Typically a dark color for light mode color palettes, or a light color for dark mode color palettes.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let inverseSurface: Color

    /// Color for content rendered ON TOP OF your inverse surface color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let inverseOnSurface: Color

    /// A tint of your primary color that is suitable for content rendered ON TOP OF your inverse surface color.
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let inversePrimary: Color

    /// Color for presenting errors.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let error: Color
    
    /// Color for content rendered ON TOP OF your error color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let onError: Color
    
    /// Background color for highlighted error content.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let errorContainer: Color


    /// Color for content rendered ON TOP OF your error container color.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let onErrorContainer: Color

    /// Color used for outlines and borders.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let outline: Color

    /// An alternative color for outlines and borders.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let outlineVariant: Color
    
    /// Color used to obscure content behind modals and popups.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let scrim: Color
    
    /// Determine an appropriate content color for a background.
    ///
    ///  Returns a matching "on" color for the specified semantic background color.
    ///  For example, if you pass the palette's `primary` color, this method will
    ///  return the palette's `onPrimary` color.
    ///
    ///  Use this method in re-usable Views like buttons in which you want to
    ///  allow for a dyanmic background/overall color to be specified by the caller
    ///  without having to also specify the content/foreground color. You can call this method to
    ///  "calculate" the appropriate "on" color.
    ///
    ///  - Parameters:
    ///    - backgroundColor: The background color for which a content color should be calculated.
    ///      It should be a color from this set of `Colors`.
    ///  - Returns: The matching "on" color for the passed in background color.
    ///    If the passed in background color is not part of this set of `Colors`, `Color.Clear` will be returned.
    public func contentColorFor(_ backgroundColor: Color) -> Color {
        switch backgroundColor {
        case primary:               onPrimary
        case primaryContainer:      onPrimaryContainer
        case secondary:             onSecondary
        case secondaryContainer:    onSecondaryContainer
        case tertiary:              onTertiary
        case tertiaryContainer:     onTertiaryContainer
        case surface:               onSurface
        case surfaceDim:            onSurface
        case surfaceBright:         onSurface
        case surfaceContainer:      onSurface
        case inverseSurface:        inverseOnSurface
        case error:                 onError
        case errorContainer:        onErrorContainer
        default:
            Color.clear
        }
    }

    
}



/// Create a semantic set of ``Colors`` for a light color mode.
///
/// Use this method to create a `Colors` instance with colors appropriate for a device in "light mode".
/// All parameters are optional, and will default to a color palette based on the standard "Apple Blue" accent color.
/// Surface and outline colors defualt to a light color (white, or light grey).
/// Call this method and pass it only the colors you wish to customize for your palette (for example, primary and secondary)
/// and rely on the defaults for others.
public func lightColorScheme(
    primary: Color = default_light_primary,
    onPrimary: Color = default_light_onPrimary,
    primaryContainer: Color = default_light_primaryContainer,
    onPrimaryContainer: Color = default_light_onPrimaryContainer,
    secondary: Color = default_light_secondary,
    onSecondary: Color = default_light_onSecondary,
    secondaryContainer: Color = default_light_secondaryContainer,
    onSecondaryContainer: Color = default_light_onSecondaryContainer,
    tertiary: Color = default_light_tertiary,
    onTertiary: Color = default_light_onTertiary,
    tertiaryContainer: Color = default_light_tertiaryContainer,
    onTertiaryContainer: Color = default_light_onTertiaryContainer,
    surface: Color = default_light_surface,
    surfaceDim: Color = default_light_surfaceContainerLow,
    surfaceBright: Color = default_light_surfaceContainerHigh,
    surfaceContainer: Color = default_light_surfaceContainer,
    onSurface: Color = default_light_onSurface,
    inverseSurface: Color = default_light_inverseSurface,
    inverseOnSurface: Color = default_light_inverseOnSurface,
    inversePrimary: Color = default_light_inversePrimary,
    error: Color = default_light_error,
    onError: Color = default_light_onError,
    errorContainer: Color = default_light_errorContainer,
    onErrorContainer: Color = default_light_onErrorContainer,
    outline: Color = default_light_outline,
    outlineVariant: Color = default_light_outlineVariant,
    scrim: Color = default_light_scrim
) -> Colors {
    return Colors(
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        surface: surface,
        surfaceDim: surfaceDim,
        surfaceBright: surfaceBright,
        surfaceContainer: surfaceContainer,
        onSurface: onSurface,
        inverseSurface: inverseSurface,
        inverseOnSurface: inverseOnSurface,
        inversePrimary: inversePrimary,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        outline: outline,
        outlineVariant: outlineVariant,
        scrim: scrim)
}

/// Create a semantic set of ``Colors`` for a dark color mode.
///
/// Use this method to create a `Colors` instance with colors appropriate for a device in "dark mode".
/// All parameters are optional, and will default to a color palette based on the standard "Apple Blue" accent color.
/// Surface and outline colors defualt to a darj color (dark grey or black).
/// Call this method and pass it only the colors you wish to customize for your palette (for example, primary and secondary)
/// and rely on the defaults for others.
public func darkColorScheme(
    primary: Color = default_dark_primary,
    onPrimary: Color = default_dark_onPrimary,
    primaryContainer: Color = default_dark_primaryContainer,
    onPrimaryContainer: Color = default_dark_onPrimaryContainer,
    secondary: Color = default_dark_secondary,
    onSecondary: Color = default_dark_onSecondary,
    secondaryContainer: Color = default_dark_secondaryContainer,
    onSecondaryContainer: Color = default_dark_onSecondaryContainer,
    tertiary: Color = default_dark_tertiary,
    onTertiary: Color = default_dark_onTertiary,
    tertiaryContainer: Color = default_dark_tertiaryContainer,
    onTertiaryContainer: Color = default_dark_onTertiaryContainer,
    surface: Color = default_dark_surface,
    surfaceDim: Color = default_dark_surfaceContainerLow,
    surfaceBright: Color = default_dark_surfaceContainerHigh,
    surfaceContainer: Color = default_dark_surfaceContainer,
    onSurface: Color = default_dark_onSurface,
    inverseSurface: Color = default_dark_inverseSurface,
    inverseOnSurface: Color = default_dark_inverseOnSurface,
    inversePrimary: Color = default_dark_inversePrimary,
    error: Color = default_dark_error,
    onError: Color = default_dark_onError,
    errorContainer: Color = default_dark_errorContainer,
    onErrorContainer: Color = default_dark_onErrorContainer,
    outline: Color = default_dark_outline,
    outlineVariant: Color = default_dark_outlineVariant,
    scrim: Color = default_dark_scrim
) -> Colors {
    return Colors(
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        surface: surface,
        surfaceDim: surfaceDim,
        surfaceBright: surfaceBright,
        surfaceContainer: surfaceContainer,
        onSurface: onSurface,
        inverseSurface: inverseSurface,
        inverseOnSurface: inverseOnSurface,
        inversePrimary: inversePrimary,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        outline: outline,
        outlineVariant: outlineVariant,
        scrim: scrim)
}


/// Calculate and return an appropriate contrasting color (white or black) based
/// on accessibility standards for the passed in color. The calculation in this method
/// is tuned for colors that are presenting using an overall "light mode" color scheme.
///
/// - Parameters:
///   - color: The background color for which a contrasting content color should be generated.
/// - Returns: Black or White color. The value returned will have an appropriate amount of contrast with
///   the passed in color.
fileprivate func lightModeContrastColor(for color: Color) -> Color {
    let luminanceThreshold = 0.175
    if (color.luminance() > luminanceThreshold) {
        return Color.black
    } else {
        return Color.white
    }
}

/// Calculate and return an appropriate contrasting color (white or black) based
/// on accessibility standards for the passed in color. The calculation in this method
/// is tuned for colors that are presenting using an overall "dark mode" color scheme.
///
/// - Parameters:
///   - color: The background color for which a contrasting content color should be generated.
/// - Returns: Black or White color. The value returned will have an appropriate amount of contrast with
///   the passed in color.
fileprivate func darkModeContrastColor(for color: Color) -> Color {
    let luminanceThreshold = 0.1833333
    if (color.luminance() > luminanceThreshold) {
        return Color.black
    } else {
        return Color.white
    }
}

#endif
