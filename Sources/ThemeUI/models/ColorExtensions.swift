import Foundation
import UIKit
import SwiftUI

extension Color {
    
    /// Create a color from an aRGB hex value.
    ///
    /// This initializer allows you to create a Color instance using an aRGB hex color value.
    /// The digits in the hex value determine the color components as follows:
    /// - First 2 digits set the transparency of the color (00 for fully transparent, and FF for fully opaque).
    /// - Second 2 digits set the red comoponent of the color.
    /// - Third 2 digits set the green component of the color.
    /// - Fourth 2 digits set the blue component of the color.
    /// For example, 0xff00ff00 represents the color Green, with no transparency.
    ///
    /// - Parameter hexNumber: The 32-bit ARGB color int to create a Color from. For example 0xff009900.
    public init(_ hexNumber: UInt64) {
        let r, g, b, a: CGFloat

        a = CGFloat((hexNumber & 0xff000000) >> 24) / 255
        r = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
        g = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
        b = CGFloat(hexNumber & 0x000000ff) / 255
        
        let color: UIColor
        
        
        self.init(uiColor: UIColor(red: r, green: g, blue: b, alpha: a))
    }
    
    /// Create a color from Red, Green, and Blue component values.
    ///
    /// This initializer allows you to create a Color instance using 8 bit color component values.
    /// For each compoent, pass a value between 0 (complete absence of that component) and
    /// 255 (full hue of that compoent).
    ///
    /// - Parameters:
    ///   - red: The red component of the color, in the range 0-255.
    ///   - green: The green component of the color, in the range 0-255.
    ///   - blue: The blue component of the color, in the range 0-255.
    public init(red: Int, green: Int, blue: Int) {
        
        let max: Double = 255
        
        let r: Double = Double(red) / max
        let g: Double = Double(green) / max
        let b: Double = Double(blue) / max
        
        self.init(red: r, green: g, blue: b)
    }
    
    /// Calcuates the "luminance" of this `Color` instance.
    /// Luminance measure how dark or light a color is, and is useful for determining
    /// appropriate contrast between colors.
    ///
    /// See [https://www.w3.org/TR/WCAG20-TECHS/G18.html](https://www.w3.org/TR/WCAG20-TECHS/G18.html)
    /// for more information.
    /// 
    /// - Returns: A Float value between 0 and 1 indicating the colors luminance.
    ///         0 is completely dark (i.e. black) and 1 is completely light (i.e. white).
    func luminance() -> CGFloat {
        // https://www.w3.org/TR/WCAG20-TECHS/G18.html#G18-tests

        let ciColor = CIColor(color: UIColor(self))

        func adjust(colorComponent: CGFloat) -> CGFloat {
            return (colorComponent < 0.04045) ? (colorComponent / 12.92) : pow((colorComponent + 0.055) / 1.055, 2.4)
        }

        return 0.2126 * adjust(colorComponent: ciColor.red) + 0.7152 * adjust(colorComponent: ciColor.green) + 0.0722 * adjust(colorComponent: ciColor.blue)
    }
    
    /// Calculates the contrast ratio between two colors.
    ///
    /// Accessibility standards dicate that text should have at least a 4.5:1 contrast ratio with the background
    /// color it is rendered on. This method will calculate the contrast ratio between two colors, and
    /// you can use it to ensure readability of text on a background color.
    /// See [https://www.w3.org/TR/WCAG20-TECHS/G18.html](https://www.w3.org/TR/WCAG20-TECHS/G18.html)
    /// for more information.
    ///
    /// - Parameters:
    ///   - color1: The first `Color` to use for calcuating the contrast ratio
    ///   - color2: The second `Color` to use for calcuating the contrast ratio.
    ///
    /// - Returns: A Float value between 0 and 1 indicating the contrast between the two colors.
    ///            0 indicates no contrast (the colors are the same) and 1 indicates full contrast (i.e. the colors are white and black).
    static func contrastRatio(between color1: Color, and color2: Color) -> CGFloat {
        // https://www.w3.org/TR/WCAG20-TECHS/G18.html#G18-tests

        let luminance1 = color1.luminance()
        let luminance2 = color2.luminance()

        let luminanceDarker = min(luminance1, luminance2)
        let luminanceLighter = max(luminance1, luminance2)

        return (luminanceLighter + 0.05) / (luminanceDarker + 0.05)
    }

    /// Calculates the contrast ratio between this color and another color.
    ///
    /// Accessibility standards dicate that text should have at least a 4.5:1 contrast ratio with the background
    /// color it is rendered on. This method will calculate the contrast ratio between two colors, and
    /// you can use it to ensure readability of text on a background color.
    /// See [https://www.w3.org/TR/WCAG20-TECHS/G18.html](https://www.w3.org/TR/WCAG20-TECHS/G18.html)
    /// for more information.
    ///
    ///  - Parameters:
    ///    - color: The color to compare with this color.
    ///
    /// - Returns: A Float value between 0 and 1 indicating the contrast between the two colors.
    ///            0 indicates no contrast (the colors are the same) and 1 indicates full contrast (i.e. the colors are white and black).    ///
    func contrastRatio(with color: Color) -> CGFloat {
        return Color.contrastRatio(between: self, and: color)
    }
}
