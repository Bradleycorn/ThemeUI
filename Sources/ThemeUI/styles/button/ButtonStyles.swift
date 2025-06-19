import Foundation
import SwiftUI

/// A SwiftUI `ButtonStyle` that renders a button with a filled background.
///
/// This style uses colors, typography, and shapes from  your ``AppTheme`` to render a button
/// with a filled background. By default the button colors are based on your theme's ``ThemeColors/primary`` color,
/// but you can pass a different set of ``ButtonColors`` to use if you prefer.
public struct FilledButtonStyle: ButtonStyle {

    /// Environment variable that tracks if the button is enabled or disabled.
    @Environment(\.isEnabled)
    private var isEnabled: Bool
    
    /// The environment object with your ``AppTheme``.
    @EnvironmentObject
    private var theme: AppTheme
    
    /// A custom set of colors that should be used instead of the default colors.
    private let customColors: ButtonColors?
    
    /// A `Shape` to use for rendering the button.
    private let shape: AnyShape

    /// Create a `FilledButtonStyle` instance.
    ///
    /// You can call the initializer without  passing any arguments, to render a button using the ``ThemeColors/deaultButtonColors``
    /// from your ``AppTheme``. Or pass in your own set of ``ButtonColors`` and/or `Shape` to cusomtize the button display.
    ///
    /// - Parameters:
    ///   - colors: A custom set of ``ButtonColors`` to use when rendering the button.
    ///             Defaults to `nil`, which will use the ``ThemeColors/deaultButtonColors`` from your ``AppTheme``.
    ///   - shape: A custom `Shape` to use when rendering the button.
    ///            Defaults to the  ``ButtonDefaults/shape`` specified in ``ButtonDefaults``.
    public init(_ colors: ButtonColors? = nil, shape: some Shape = ButtonDefaults.shape) {
        self.customColors = colors
        self.shape = AnyShape(shape)
    }
    
    /// A computed property that determines the ``ButtonColors`` to use for rendering.
    /// It will use the `customColors` if they are defined, or ``Colors/deaultButtonColors``
    /// if no `customColors` are defined.
    private var colors: ButtonColors {
        customColors ?? ButtonDefaults.colors(from: theme.colorScheme)
    }

    /// Render the button and apply appropriate styling.
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(ThemedButtonStyle(padding: ButtonDefaults.padding, colors: colors, shape: shape))
    }
}

/// A SwiftUI `ButtonStyle` that renders a button with a transparent background and outline.
///
/// This style uses colors, typography, and shapes from  your ``AppTheme`` to render a button
/// with colored text content and outline, and a transparent background.
/// By default the button colors are based on your theme's ``ThemeColors/primary`` color,
/// but you can pass a different set of ``ButtonColors`` to use if you prefer.
public struct OutlinedButtonStyle: ButtonStyle {

    /// Environment variable that tracks if the button is enabled or disabled.
    @Environment(\.isEnabled)
    private var isEnabled: Bool
    
    /// The environment object with your ``AppTheme``.
    @EnvironmentObject
    private var theme: AppTheme
    
    /// A custom set of colors that should be used instead of the default colors.
    private let customColors: ButtonColors?


    /// A `Shape` to use for rendering the button.
    private let shape: AnyShape
    
    /// Create an `OutlinedButtonStyle` instance.
    ///
    /// You can call the initializer without  passing any arguments, to render a button using the ``ThemeColors/outlinedButtonColors``
    /// from your ``AppTheme``. Or pass in your own set of ``ButtonColors`` and/or `Shape` to cusomtize the button display.
    ///
    /// - Parameters:
    ///   - colors: A custom set of ``ButtonColors`` to use when rendering the button.
    ///             Defaults to `nil`, which will use the ``ThemeColors/outlinedButtonColors`` from your ``AppTheme``.
    ///   - shape: A custom `Shape` to use when rendering the button.
    ///            Defaults to the  ``ButtonDefaults/shape`` specified in ``ButtonDefaults``.
    public init(_ colors: ButtonColors? = nil, shape: some Shape = ButtonDefaults.shape) {
        self.customColors = colors
        self.shape = AnyShape(shape)
    }
        
    /// A computed property that determines the ``ButtonColors`` to use for rendering.
    /// It will use the `customColors` if they are defined, or ``Colors/outlinedButtonColors``
    /// if no `customColors` are defined.
    private var colors: ButtonColors {
        customColors ?? ButtonDefaults.outlinedColors(from: theme.colorScheme)
    }
    
    /// A computed property that determines the color to use for the outline, based on whether
    /// the button is enabled or disabled.
    private var outlineColor: Color {
        (isEnabled) ? colors.foregroundColor : colors.disabledForegroundColor
    }
    
    /// Render the button and apply appropriate styling.
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(ThemedButtonStyle(padding: ButtonDefaults.padding, colors: colors, shape: shape))
            .overlay(
                shape
                    .stroke(outlineColor, lineWidth: ButtonDefaults.outlinedButtonBorderWidth)
            )
    }
}

/// A SwiftUI `ButtonStyle` that renders a "plain" text button with transparent background and no
/// other visual elements.
///
/// This style uses colors, typography, and shapes from  your ``AppTheme`` to render a button.
/// By default the button foreground colors are based on your theme's ``ThemeColors/primary`` color,
/// but you can pass a different set of ``ButtonColors`` to use if you prefer.
public struct TextButtonStyle: ButtonStyle {

    /// Environment variable that tracks if the button is enabled or disabled.
    @Environment(\.isEnabled)
    private var isEnabled: Bool
    
    /// The environment object with your ``AppTheme``.
    @EnvironmentObject
    private var theme: AppTheme
    
    /// A custom set of colors that should be used instead of the default colors.
    private let customColors: ButtonColors?
    
    /// Create a `TextButtonStyle` instance.
    ///
    /// You can call the initializer without  passing any arguments, to render a button using the ``ThemeColors/textButtonColors``
    /// from your ``AppTheme``. Or pass in your own set of ``ButtonColors``.
    ///
    /// - Parameters:
    ///   - colors: A custom set of ``ButtonColors`` to use when rendering the button.
    ///             Defaults to `nil`, which will use the ``ThemeColors/textButtonColors`` from your ``AppTheme``.
    public init(_ colors: ButtonColors? = nil) {
        self.customColors = colors
    }
        
    /// A computed property that determines the ``ButtonColors`` to use for rendering.
    /// It will use the `customColors` if they are defined, or ``ThemeColors/textButtonColors``
    /// if no `customColors` are defined.
    private var colors: ButtonColors {
        customColors ?? ButtonDefaults.textColors(from: theme.colorScheme)
    }
        
    /// Render the button and apply appropriate styling.
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(ThemedButtonStyle(padding: EdgeInsets(), colors: colors, shape: AnyShape(Rectangle())))
            .bold()
    }
}

/// A `ViewModifier` that applies common styling modifiers
/// to buttons of any/all styles.
fileprivate struct ThemedButtonStyle: ViewModifier {

    /// Environment variable that tracks if the button is enabled or disabled.
    @Environment(\.isEnabled)
    private var isEnabled: Bool

    /// A set of `EdgeInsets` that determies the amount of padding that should
    /// be included in the rendered button.
    var padding: EdgeInsets
    
    /// A set of ``ButtonColors`` to use for rendering the button background and foreground.
    var colors: ButtonColors
    
    /// A `Shape` to be applied to the button.
    var shape: AnyShape

    /// A calculated property that sets the button's background color based on whether it's enabled or disabled.
    private var backgroundColor: Color {
        (isEnabled) ? colors.backgroundColor : colors.disabledBackgroundColor
    }
    
    /// A calculated property that sets the button's foreground color based on whether it's enabled or disabled.
    private var foregroundColor: Color {
        (isEnabled) ? colors.foregroundColor : colors.disabledForegroundColor
    }
    
    /// Render the button and apply appropriate modifiers.
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(backgroundColor)
            .foregroundStyle(foregroundColor)
            .clipShape(shape)
    }
}


/// A  set of colors to be applied when rednering a button.
///
/// Many colors are used to render a button, including background and foreground colors,
/// and alternate colors for disabled states. The `ButtonColors` struct encapsulates all
/// of the various colors that may be used to render a button.
public struct ButtonColors {
    
    /// A `Color` to use for the background fill of a button in its "enabled" state. This `Color`
    /// should have sufficient contrast with the `foregroundColor.`
    let backgroundColor: Color
    
    /// A `Color` to use for the foreground button content in it's "enabled" state. This `Color`
    /// should have sufficient contrast with the `backgroundColor.`
    let foregroundColor: Color
    
    /// A `Color` to use for the background fill of a button in its "disabled" state. This `Color`
    /// should have sufficient contrast with the `disabledForegroundColor.`
    let disabledBackgroundColor: Color

    /// A `Color` to use for the foreground button content in it's "disabled" state. This `Color`
    /// should have sufficient contrast with the `disabledBackgroundColor.`
    let disabledForegroundColor: Color

    /// Create a new instance of ``ButtonColors`` using values from this instance
    /// as defaults.
    ///
    /// This method is useful when you have an existing set of button colors and you want to create
    /// a new set using some of the colors from your existing set, while using new values for some
    /// of the other colors in the set. Call this method, and only include parameters for the  new values
    /// that you wish to use, and it will create a set of button colors using those new values, and will
    /// use values from this instance for any others that you do not specify.
    ///
    /// - Parameters:
    ///   - backgroundColor: An optional `Color` to use as the background color in the "enabled" state.
    ///   If no value is passed, the `backgroundColor` from this instance will be used.
    ///   - foregroundColor: An optional `Color` to use as the foreground color in the "enabled" state.
    ///   If no value is passed, the `foregroundColor` from this instance will be used.
    ///   - disabledBackgroundColor: An optional `Color` to use as the background color in the "disabled" state.
    ///   If no value is passed, the `disabledBackgroundColor` from this instance will be used.
    ///   - disabledForegroundColor: An optional `Color` to use as the foreground color in the "disabled" state.
    ///   If no value is passed, the `disabledForegroundColor` from this instance will be used.
    /// - Returns: A new `ButtonColors` instance using the colors that were passed in, 
    ///   and colors from this intance for any colors that were not passed in.
    public func copy(
        backgroundColor: Color? = nil,
        foregroundColor: Color? = nil,
        disabledBackgroundColor: Color? = nil,
        disabledForegroundColor: Color? = nil) -> ButtonColors {
            
            ButtonColors(
                backgroundColor: backgroundColor ?? self.backgroundColor,
                foregroundColor: foregroundColor ?? self.foregroundColor,
                disabledBackgroundColor: disabledBackgroundColor ?? self.disabledBackgroundColor,
                disabledForegroundColor: disabledForegroundColor ?? self.disabledForegroundColor)
        }
}

extension ThemeColors {    
    
    /// An  instance of ``ButtonColors``based on the ``ThemeColors/primary`` color, suitable
    /// for use with buttons that have a filled background color.
    public var deaultButtonColors: ButtonColors {
        ButtonColors(
            backgroundColor: primary,
            foregroundColor: onPrimary,
            disabledBackgroundColor: primaryContainer,
            disabledForegroundColor: onPrimaryContainer.opacity(0.35))
    }
    
    /// An  instance of ``ButtonColors``based on the ``ThemeColors/primary`` color, suitable
    /// for use with buttons that have a transparent background.
    public var outlinedButtonColors: ButtonColors {
        ButtonColors(
            backgroundColor: .clear,
            foregroundColor: primary,
            disabledBackgroundColor: .clear,
            disabledForegroundColor: primary.opacity(0.5))
    }
    
    /// An  instance of ``ButtonColors``based on the ``ThemeColors/primary`` color, suitable
    /// for use with buttons that have a transparent background and no other visual elements such
    /// as borders or outlines.
    public var textButtonColors: ButtonColors{
        ButtonColors(
            backgroundColor: .clear,
            foregroundColor: primary,
            disabledBackgroundColor: .clear,
            disabledForegroundColor: primary.opacity(0.5)
        )
    }
}

#Preview {
    DefaultTheme {
        VStack {
            Button("Filled Enabled", action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
                .buttonStyle(FilledButtonStyle())
            
            Button("Filled Disabled", action: {})
                .buttonStyle(FilledButtonStyle())
                .disabled(true)
            
            Button("Outlined Enabled", action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
                .buttonStyle(OutlinedButtonStyle())
            
            Button("Outlined Disabled", action: {})
                .buttonStyle(OutlinedButtonStyle())
                .disabled(true)

            Button("Text Enabled", action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/)
                .buttonStyle(TextButtonStyle())
            
            Button("Text Disabled", action: {})
                .buttonStyle(TextButtonStyle())
                .disabled(true)
        }
    }
}
