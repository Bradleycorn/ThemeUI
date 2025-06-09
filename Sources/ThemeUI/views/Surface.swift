#if os(iOS)
import SwiftUI

/// A container view for entire screens, modals, and other large blocks of content.
///
/// A `Surface` applies a background color, foreground color, content alignment, and edge insets
/// for a block of content. It is especially useful for high level containers such as an entire screen, modals, sheets,
/// dialogs, cards, etc.
///
/// You can render a surface with an explict set of colors and alignment, or rely on your ``AppTheme``
/// to provide default colors suitable for large surfaces like an entire screen.
public struct Surface<Content: View>: View {

    /// The ``AppTheme`` has been set as an Environment object.
    @EnvironmentObject
    private var theme: AppTheme

    /// A custom color to use as the surface background.
    private let color: Color?
    
    /// A custom color to use as the foreground color for content on this surface.
    private let contentColor: Color?
    
    /// An `Alginment` that will be applied to the surface, defining how content on the surface should be aligned.
    private let alignment: Alignment
    
    /// An `Edge.Set` that defines the edges that the surface should consume when rendering its background.
    private let consumeEdges: Edge.Set

    
    /// The content to be rendered on the surface.
    let content: () -> Content

    /// Create a surface.
    ///
    /// - Parameters:
    ///   - color: A `Color` to apply to the surface's background.
    ///   Defaults to the ``Colors/surface`` color from the current ``AppTheme``.
    ///   - contentColor: A `Color` to apply to foreground content on the surface.
    ///   Defaults to the ``Colors/onSurface`` color from the current ``AppTheme``.
    ///   - alignment: An `Alignment` to apply to content on the surface.
    ///   Defaults to `.center`.
    ///   - consumeEdges: An `Edge.Set` that defines a set of edges that should be consumed when drawing the surface background.
    ///   Defaults to an empty set (don't consume any edges).
    ///   - content: A `@ViewBuilder` that contains the content to be rendered on this surface.
    public init(color: Color? = nil, contentColor: Color? = nil, alignment: Alignment = .center, consumeEdges: Edge.Set = [], @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.contentColor = contentColor
        self.alignment = alignment
        self.consumeEdges = consumeEdges
        self.content = content
    }
    
    
    /// A calculated property to set the surface background. 
    /// Uses the color passed to the initializer, or the ``Colors/surface``
    /// no color was passed.
    private var background: Color {
        color ?? theme.colorScheme.surface
    }
    
    /// A calculated property to set the foreground color for content.
    /// Uses the color passed to the initializer, or the ``Colors/onSurface``
    /// no color was passed.
    private var foreground: Color {
        contentColor ?? theme.colorScheme.contentColorFor(background)
    }
    
    /// Render the surface and it's content.
    public var body: some View {
        ZStack(alignment: alignment) {
            background.ignoresSafeArea(.all, edges: consumeEdges)
            content()
        }
        .foregroundStyle(foreground)
    }
}

struct Surface_Previews: PreviewProvider {

    struct PreviewContent: View {
        @EnvironmentObject var theme: AppTheme

        var body: some View {
            Surface(color: theme.colorScheme.primaryContainer, alignment: .top, consumeEdges: .top) {
                VStack {
                    Text("Surface Content")
                    Button(action: {}) {
                        Text("Button")
                    }
                    .buttonStyle(FilledButtonStyle())
                }
           }
        }
    }
    
    static var previews: some View {
        DefaultTheme {
            PreviewContent()
        }
    }
    
}
#endif
