#if os(iOS)
import SwiftUI


/// A container View that creates an ``AppTheme`` and sets it as an Environment Object.
///
/// A `ThemedView` is the root of a View Tree to which an ``AppTheme`` is applied. Often times, it
/// is the root view of your SwiftUI App.  This view does not render any content itself. Instead, it creates an
/// ``AppTheme`` from the values passed to it, and registers that theme as an Environment Object that child
/// views can consume and use to render content using the theme.
///
/// ```swift
///@main
///struct AffiliateApp: App {
///    @Environment(\.colorScheme) var colorMode
///
///    private var themeColors: Colors {
///        switch colorMode {
///            case .dark:
///                darkColorScheme()
///            default:
///                lightColorScheme()
///        }
///    }
///
///    private var themeType = Typography()
///    private var themeShapes = Shapes()
///
///    var body: some Scene {
///        WindowGroup {
///            ThemedView(colors: themeColors, typography: themeType, shapes: themeShapes) {
///                MyAppContent()
///            }
///        }
///    }
///}
/// ```
public struct ThemedView<Content: View>: View {

    /// An ``AppTheme`` that child components can use to apply theming to their UI components.
    private let theme: AppTheme
    
    /// Child content to be rendered.
    private let content: () -> Content

    /// Creates a ThemedView, and sets the ``AppTheme``.
    ///
    /// - Parameters:
    ///   - colors: A set of ``Colors`` to use in the theme.
    ///   - typography: A set of ``Typography`` to use in the theme.
    ///   - shapes: A set of ``Shapes`` to use in the theme.
    public init(colors: Colors = lightColorScheme(), typography: Typography = Typography(), shapes: Shapes = Shapes(), @ViewBuilder content: @escaping ()->Content) {
        theme = AppTheme(colors, typography, shapes)
        self.content = content
    }

    /// Render the child content, and set the ``AppTheme`` Environment object.
    public var body: some View {
        content()
            .environmentObject(theme)
            .environment(\.font, theme.typography.bodyLarge)
    }
}


/// A basic ``ThemedView`` that sets up an ``AppTheme`` with default values.
///
/// This view can be useful for creating Previews of views that use an ``AppTheme`` Environment Object.
struct DefaultTheme<Content: View>: View {
    private let content: () -> Content

    @Environment(\.colorScheme) var colorMode
    
    private var colors: Colors {
        switch colorMode {
            case .dark:
                darkColorScheme()
            default:
                lightColorScheme()
        }
    }
    
    init(
        @ViewBuilder content: @escaping ()->Content) {
            self.content = content
    }
    
    var body: some View {
        ThemedView(colors: colors, typography: Typography(), shapes: Shapes(), content: content)
    }
}
#endif
