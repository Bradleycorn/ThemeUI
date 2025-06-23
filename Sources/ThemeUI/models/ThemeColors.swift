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
public struct ThemeColors {
    
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
    
    /// The primary content color.  Used for content rendered ON TOP OF a surface.
    ///
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let onSurface: Color

    /// Another option for a color with similar uses of ``surface``.
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let surfaceVariant: Color
    
    /// The color (and state variants) that can be used for content on top of surface.
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let onSurfaceVariant: Color
    
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


    /// A surface variant for containers with lower emphasis than ``surfaceContainerLow``.
    /// Use this role for content which requires less emphasis than ``surfaceContainerLow``.
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let surfaceContainerLowest: Color

    /// A surface variant for containers with lower emphasis than ``surfaceContainer``.
    /// Use this role for content which requires less emphasis than ``surfaceContainer``.
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let surfaceContainerLow: Color

    /// A surface variant for containers with higher emphasis than ``surfaceContainer``.
    /// Use this role for content which requires more emphasis than ``surfaceContainer``.
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let surfaceContainerHigh: Color

    ///  A surface variant for containers with higher emphasis than ``surfaceContainerHigh``.
    ///  Use this role for content which requires more emphasis than ``surfaceContainerHigh``.
    /// See the <doc:Color#Creating-a-Color-Palette> documentation
    /// for more information.
    public let surfaceContainerHighest: Color

    
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
    ///    If the passed in background color is not part of this set of `Colors`, white or black will be returned.
    public func contentColorFor(_ backgroundColor: Color) -> Color {
        switch backgroundColor {
        case primary:                 onPrimary
        case primaryContainer:        onPrimaryContainer
        case secondary:               onSecondary
        case secondaryContainer:      onSecondaryContainer
        case tertiary:                onTertiary
        case tertiaryContainer:       onTertiaryContainer
        case surface:                 onSurface
        case surfaceDim:              onSurface
        case surfaceBright:           onSurface
        case surfaceContainer:        onSurface
        case surfaceContainerLowest:  onSurface
        case surfaceContainerLow:     onSurface
        case surfaceContainerHigh:    onSurface
        case surfaceContainerHighest: onSurface
        case surfaceVariant:          onSurfaceVariant
        case inverseSurface:          inverseOnSurface
        case error:                   onError
        case errorContainer:          onErrorContainer
        default: backgroundColor.contrastColor
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
    onSurface: Color = default_light_onSurface,
    surfaceVariant: Color = default_light_surface,
    onSurfaceVariant: Color = default_light_onSurface,
    inverseSurface: Color = default_light_inverseSurface,
    inverseOnSurface: Color = default_light_inverseOnSurface,
    inversePrimary: Color = default_light_inversePrimary,
    error: Color = default_light_error,
    onError: Color = default_light_onError,
    errorContainer: Color = default_light_errorContainer,
    onErrorContainer: Color = default_light_onErrorContainer,
    outline: Color = default_light_outline,
    outlineVariant: Color = default_light_outlineVariant,
    scrim: Color = default_light_scrim,
    surfaceDim: Color = default_light_surfaceContainerLow,
    surfaceBright: Color = default_light_surfaceContainerHigh,
    surfaceContainer: Color = default_light_surfaceContainer,
    surfaceContainerLowest: Color = default_light_surfaceContainerLow,
    surfaceContainerLow: Color = default_light_surfaceContainerLow,
    surfaceContainerHigh: Color = default_light_surfaceContainerHigh,
    surfaceContainerHighest: Color = default_light_surfaceContainerHigh
) -> ThemeColors {
    return ThemeColors(
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
        onSurface: onSurface,
        surfaceVariant: surfaceVariant,
        onSurfaceVariant: onSurfaceVariant,
        inverseSurface: inverseSurface,
        inverseOnSurface: inverseOnSurface,
        inversePrimary: inversePrimary,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        outline: outline,
        outlineVariant: outlineVariant,
        scrim: scrim,
        surfaceDim: surfaceDim,
        surfaceBright: surfaceBright,
        surfaceContainer: surfaceContainer,
        surfaceContainerLowest: surfaceContainerLowest,
        surfaceContainerLow: surfaceContainerLow,
        surfaceContainerHigh: surfaceContainerHigh,
        surfaceContainerHighest: surfaceContainerHighest
    )
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
    onSurface: Color = default_dark_onSurface,
    surfaceVariant: Color = default_dark_surface,
    onSurfaceVariant: Color = default_dark_onSurface,
    inverseSurface: Color = default_dark_inverseSurface,
    inverseOnSurface: Color = default_dark_inverseOnSurface,
    inversePrimary: Color = default_dark_inversePrimary,
    error: Color = default_dark_error,
    onError: Color = default_dark_onError,
    errorContainer: Color = default_dark_errorContainer,
    onErrorContainer: Color = default_dark_onErrorContainer,
    outline: Color = default_dark_outline,
    outlineVariant: Color = default_dark_outlineVariant,
    scrim: Color = default_dark_scrim,
    surfaceDim: Color = default_light_surfaceContainerLow,
    surfaceBright: Color = default_light_surfaceContainerHigh,
    surfaceContainer: Color = default_light_surfaceContainer,
    surfaceContainerLowest: Color = default_light_surfaceContainerLow,
    surfaceContainerLow: Color = default_light_surfaceContainerLow,
    surfaceContainerHigh: Color = default_light_surfaceContainerHigh,
    surfaceContainerHighest: Color = default_light_surfaceContainerHigh

) -> ThemeColors {
    return ThemeColors(
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
        onSurface: onSurface,
        surfaceVariant: surfaceVariant,
        onSurfaceVariant: onSurfaceVariant,
        inverseSurface: inverseSurface,
        inverseOnSurface: inverseOnSurface,
        inversePrimary: inversePrimary,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        outline: outline,
        outlineVariant: outlineVariant,
        scrim: scrim,
        surfaceDim: surfaceDim,
        surfaceBright: surfaceBright,
        surfaceContainer: surfaceContainer,
        surfaceContainerLowest: surfaceContainerLowest,
        surfaceContainerLow: surfaceContainerLow,
        surfaceContainerHigh: surfaceContainerHigh,
        surfaceContainerHighest: surfaceContainerHighest)
}

/// A SwiftUI View that previews the color scheme of the current AppTheme.
/// You may wish to use this view as a Preview in your app to visuallize the colors in your ``ThemeColors``.
public struct ThemeColorsPreview: View {
    @EnvironmentObject var theme: AppTheme

    // We have to explicitly define an initializer so we can specify that it is "public".
    // Otherwise, it will be internal by default, and consuming apps can't call it.
    public init() {}
    
    public var body: some View {
        VStack(spacing: 12) {
            Text("Brand Colors")
                .fontWeight(.bold)
            BrandColors()
        
            Text("Surface Colors")
                .fontWeight(.bold)
            SurfaceColors()
            Text("Error & Inverse Colors")
                .fontWeight(.bold)
            ErrorAndInverseColors()
            
        }.padding(.all, 8)
    }
}

fileprivate struct ThemeColor: View {
    @EnvironmentObject var theme: AppTheme
    
    let color: Color
    let name: String

    var body: some View {
        VStack(spacing: 0) {
            ColorPreview(color, name: name, width: .infinity)
            ColorPreview(theme.colorScheme.contentColorFor(color), name: "On \(name)", width: .infinity)
        }
    }
}

fileprivate struct BrandColors: View {
    @EnvironmentObject var theme: AppTheme
    
    var body: some View {
        HStack(spacing: 4) {
            VStack(spacing: 2) {
                ThemeColor(color: theme.colorScheme.primary, name: "Primary")
                ThemeColor(color: theme.colorScheme.primaryContainer, name: "Primary Container")
            }
            VStack(spacing: 2) {
                ThemeColor(color: theme.colorScheme.secondary, name: "Secondary")
                ThemeColor(color: theme.colorScheme.secondaryContainer, name: "Secondary Container")
            }
            VStack(spacing: 2) {
                ThemeColor(color: theme.colorScheme.tertiary, name: "Tertiary")
                ThemeColor(color: theme.colorScheme.tertiaryContainer, name: "Tertiary Container")
            }
        }
    }
}

fileprivate struct SurfaceColors: View {
    @EnvironmentObject var theme: AppTheme

    var body: some View {
        VStack(spacing: 2) {
            HStack(spacing: 0) {
                ColorPreview(theme.colorScheme.surfaceDim, name: "Surface Dim", width: .infinity)
                ColorPreview(theme.colorScheme.surface, name: "Surface", width: .infinity)
                ColorPreview(theme.colorScheme.surfaceBright, name: "Surface Bright", width: .infinity)
            }
            HStack(spacing: 0) {
                ColorPreview(theme.colorScheme.surfaceContainerLowest, name: "Surf. Cont. Lowest", width: .infinity)
                ColorPreview(theme.colorScheme.surfaceContainerLow, name: "Surf. Cont. Low", width: .infinity)
                ColorPreview(theme.colorScheme.surfaceContainer, name: "Surface Container", width: .infinity)
                ColorPreview(theme.colorScheme.surfaceContainerHigh, name: "Surf. Cont. High", width: .infinity)
                ColorPreview(theme.colorScheme.surfaceContainerHighest, name: "Surf. Cont. Highest", width: .infinity)
            }
            
            HStack(spacing: 0) {
                ColorPreview(theme.colorScheme.onSurface, name: "On Surface", width: .infinity)
                ColorPreview(theme.colorScheme.outline, name: "Outline", width: .infinity)
                ColorPreview(theme.colorScheme.outlineVariant, name: "Outline Variant", width: .infinity)
            }
            
            HStack(alignment: .top, spacing: 2) {
                ThemeColor(color: theme.colorScheme.surfaceVariant, name: "Surface Variant")
                ColorPreview(theme.colorScheme.scrim, name: "Scrim", width: .infinity)
            }
        }
    }
}

fileprivate struct ErrorAndInverseColors: View {
    @EnvironmentObject var theme: AppTheme
    
    var body: some View {
        HStack(alignment: .top, spacing: 4) {
            VStack(spacing: 2) {
                ThemeColor(color: theme.colorScheme.error, name: "Error")
                ThemeColor(color: theme.colorScheme.errorContainer, name: "Error Container")
            }
            VStack(spacing: 0) {
                ColorPreview(theme.colorScheme.inverseSurface, name: "Inverse Surface", width: .infinity)
                ColorPreview(theme.colorScheme.inverseOnSurface, name: "Inverse On Surface", width: .infinity)
                ColorPreview(theme.colorScheme.inversePrimary, name: "Inverse Primary", width: .infinity)
            }
        }
    }
}


#Preview {
    let colorScheme = lightColorScheme()
    
    ThemedView(colors: colorScheme) {
        ThemeColorsPreview()
    }
    .background(.gray.opacity(0.1))
}

