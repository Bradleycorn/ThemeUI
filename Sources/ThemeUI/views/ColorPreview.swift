#if os(iOS)
import Foundation
import SwiftUI

/// A view for use in Previews to render a `Color` swatch.
public struct ColorPreview: View {
    
    /// The Color to be rendered
    let color: Color
    
    /// A name for the color being rendered.
    let name: String
    
    /// The width of the view.
    let width: CGFloat
    
    /// the height of the view.
    let height: CGFloat

    /// A calculated property to determine the color to use
    /// when rendering the name on top of the color swatch.
    var textColor: Color {
        (color.luminance() < 0.5) ? .white : .black
    }

    /// Create a color preview with a specific width and height.
    ///
    /// - Parameters:
    ///   - color: The `Color` to render.
    ///   - name: A name for the color. It will be rendered on top of the color swatch.
    ///   - width: The width of the color swatch to render. Defaults to 50
    ///   - height: The height of the color swatch to render. Defaults 50.
    public init(_ color: Color, name: String = "", width: CGFloat = 50, height: CGFloat = 50) {
        self.color = color
        self.name = name
        self.width = width
        self.height = height
    }

    /// Create a color preview with an equal width and height.
    ///
    /// - Parameters:
    ///  - color: The `Color` to render.
    ///  - name: A name for the color. It will be rendered on top of the color swatch.
    ///  - size: The width and height of the color swatch to render. Defaults to 50
    public init(_ color: Color, name: String = "", size: CGFloat = 50) {
        self.init(color, name: name, width: size, height: size)
    }
    
    /// Render the color swatch.
    public var body: some View {
        ZStack(alignment: .topLeading) {
            color
            Text(name)
                .foregroundStyle(textColor.opacity(0.8))
                .font(.system(size: 12))
                .padding(4)
        }.frame(width: width, height: height, alignment: .center)
    }
}

#endif
