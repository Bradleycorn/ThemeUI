#  Defining Colors
Tools and tips for defining and working with colors in ThemeUI

## Overview

There are several ways to define colors in a SwiftUI app, but they all fall into one of two distinct categories.
Colors can be defined in an Asset Catalog, or they can be defined in code, using one of the `Color` initializers.
ThemeUI works with colors that are defined using either method. You could even use both methods to define theme
colors if you want! 

> Tip: We recommend defining your colors in code when building a pure SwiftUI app. See the <doc:ColorConsiderations>
documenation for more information.

### Creating Colors from Hex Codes
Often we are provided colors from design teams as hex codes, such as #248FF1. And in some cases a designer might
specifiy a hex color code and indicate that the color should have some level of transparency. To facilitate creating
colors in code using these values, ThemeUI extends the `Color` struct, adding a convenience initializer to create
a `Color` instance using a hex code and opacity in the form of an aRGB value. 

```swift
let myColor = Color(0xFF248FF1)
```

The above code creates a SwiftUI `Color` using the #248FF1 color (a light/bright shade of blue), with the 
first 2 digits of the hexidecimal number (`FF`) indicating the alpha (opacity) level; in this case, fuly opaque
with no transparency. 



## Recommended Color Definitions 
An enterprise application probably uses many colors, and several shades of any one color. The goal of any project 
should be to remain "DRY" (don't repeat yourself), and color definitions are no exception. You may use the same shade 
of blue in several of your semantic colors (light mode primary, dark mode primary, inverse surface, etc), but
it's still a single and specfic shade of blue (say #248FF1). So, it should be defined as such:

```swift
let lightBlue = Color(0xFF248FF1)
```

With your specific color defined you can now use it to create your semantic color palatte for use with ThemeUI:
```swift
let myLightcolors = ligyhtColorScheme(
  primary: lightBlue,
  primaryContainer: lightBlue,
  onPrimary: .white
)
```

This makes maintenance easy. If your design team updates the "lightBlue" shade slightly, you only have to change it in one place and your entire Theme is updated:
```swift
let lightBlue = Color(0xFF2279FF)
```

Or, maybe you want to change the color scheme entirely, and now use a Purple color for your primary color. 
Finding and updating your theme is pretty easy. Define your new shade of purple, and delete your lightBlue variable. 
With your lightBlue variable deleted, your code won't compile and Xcode will show you a syntax error for each 
spot (in your theme definition) where you were using lightBlue. Now you can easily update all of those to Purple 
and you are ready to go with your new color scheme.

### Defining Shades of Color
An enterprise level application will probably define several shades of any one color. For example, you might 
have several shades of blue ranging from a dark navy blue to a very light sky blue, and various shades used 
for various semantic theme colors. There are several ways to define several shades of a single color, 
possibly using enums, structs, or other mechanisms. We have found that a simple solution is quite effective. 
We define a set of contants, one for each shade of the color, with the same base name "Blue", and a two digit 
numeric value to reference the luminance (light/dark) scale value, with 00 being a dark shade, and 99 being a light 
shade. For example:

```swift
let Blue10 = Color(0xFF001C3A)
let Blue20 = Color(0xFF042A51)
let Blue30 = Color(0xFF294870)
let Blue40 = Color(0xFF425F89)
let Blue50 = Color(0xFF0077CF)
let Blue60 = Color(0xFF248FF1)
let Blue80 = Color(0xFFA2C9FF)
let Blue90 = Color(0xFFABC8F8)
```

With our shades of blue defined, we can now define a Theme with light and dark mode colors that use these values:
```swift
    let lightColors: Colors? = lightColorScheme(
        primary: Blue20,
        onPrimary: .white,
        primaryContainer: Blue30,
        onPrimaryContainer: .white,
        inversePrimary: Blue90,
        secondary: Blue60,
        onSecondary: .white,
        secondaryContainer: Blue80,
        onSecondaryContainer: Blue10
    )
    
    let darkColors: Colors? = darkColorScheme(
        primary: Blue10,
        onPrimary: .white,
        primaryContainer: Blue30,
        onPrimaryContainer: .white,
        inversePrimary: Blue40,
        secondary: Blue60,
        onSecondary: .white,
        secondaryContainer: Blue50,
        onSecondaryContainer: .white
    )
```

### Color Previews

ThemeUI provides a `ColorPreview` SwiftUI view that is useful for building a preview rendering of your color palatte. 
A preview for the set of blue colors defined above might look like:
```swift
#Preview("Blue") {
    VStack {
        ColorPreview(Blue10, name: "10")
        ColorPreview(Blue20, name: "20")
        ColorPreview(Blue30, name: "30")
        ColorPreview(Blue40, name: "40")
        ColorPreview(Blue50, name: "50")
        ColorPreview(Blue60, name: "60")
        ColorPreview(Blue80, name: "80")
        ColorPreview(Blue90, name: "90")
    }
}
```
![Color Previews Screenshot](color-preview)

### Dynamically Handling "On"/Content Colors
With SwiftUI, we place an emphasis on writing re-useable views. A common use case is to create a view that 
can be rendered in a variety of colors.For example, you might write a commong Button component (MyAppButton) 
and you want to render buttons with any color background (primary, secondary, tertiary, etc). Ideally a caller 
should only have to specify the "main" color for the button background, and the Button component should be able 
to automatically figure out the text/content color to use on the background. The `ColorScheme` in ThemeUI provides 
a utility method to handle this case. 

Your view can use ``Colors/contentColorFor(_:)`` to get an appropriate "on" content color for a given color. 
We can leverage this to write our Button view:
```swift
struct MyAppButton: View {
  @EnvironmentObject var appTheme: AppTheme

  private let backgroundColor: Color
  private let text: String
  private let onClick: ()->Void

  init(color: Color, text: String, onClick: @escaping () -> Void) {
    self.backgroundColor = color
    self.foregroundColor = foregroundColor
    self.text = text
    self.onClick = onClick
  }

  var textColor: Color {
    appTheme.colorScheme.contentColorFor(backgroundColor)
  }

  var body: some View {
    Button(action: onClick) {
       Text(text)
    }
    .background(backgroundColor)
    .foregroundStyle(textColor)
  }
}
```
If we call the above View and pass it our theme's `primary` color, it will use the 
theme's `onPrimary` as the foreground color.
