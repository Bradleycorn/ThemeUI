# Color
Customizing your Theme's color pallete.

## Overview
ThemeUI provides an extensive palette of semantically named colors via the
``ColorScheme`` class. It also provides helper methods to create a set of colors
starting from a sane set of defaults, allowing you to customize as much or as little
of the palette as you like.

## Creating a Color Palette
You can create an instance of `ColorScheme` directly by calling it's initializer and passing in color values for each of the semantically named colors. 

For convenience, ThemeUI also includes a set of sane default colors (based on the default "ios Blue" accent color)
and exposes two top level functions to create a `ColorScheme` using the defaults, while allowing you to pass in only
the colors you want to override for your brand. 

 - ``lightColorScheme(primary:onPrimary:primaryContainer:onPrimaryContainer:secondary:onSecondary:secondaryContainer:onSecondaryContainer:tertiary:onTertiary:tertiaryContainer:onTertiaryContainer:surface:surfaceDim:surfaceBright:surfaceContainer:onSurface:inverseSurface:inverseOnSurface:inversePrimary:error:onError:errorContainer:onErrorContainer:outline:outlineVariant:scrim:)`` 

    This function to creates a `ColorScheme` for an app using default values that are suitable for a device in light mode. 

- ``darkColorScheme(primary:onPrimary:primaryContainer:onPrimaryContainer:secondary:onSecondary:secondaryContainer:onSecondaryContainer:tertiary:onTertiary:tertiaryContainer:onTertiaryContainer:surface:surfaceDim:surfaceBright:surfaceContainer:onSurface:inverseSurface:inverseOnSurface:inversePrimary:error:onError:errorContainer:onErrorContainer:outline:outlineVariant:scrim:)``

  This function to creates a `ColorScheme` for an app using default values that are suitable for a device in dark mode. 


All agruments for both of these methods are optional. You can call them
without passing any parameters at all to get a set of sane default colors for your app. Or call them, and pass in only the colors
you need, and the defaults will be used for other, unspecified colors. 

The example below defines a set of colors using specific primary and secondary colors, but uses the defaults for others (surface, error, etc). 
```swift
let myLightColors = lightColorScheme(
    primary: Color(0xFF024A51),
    onPrimary: .white,
    primaryContainer: Color(0xFF248FF1)
    secondary: Color(0xFF248FF1)
    onSecondary: .white
    secondaryContainer: Color(0xFF248FF1)
)

let myDarkColors = darkColorScheme(
    primary: Color(0xFF024A51),
    onPrimary: .white,
    primaryContainer: Color(0xFF248FF1)
    secondary: Color(0xFF248FF1)
    onSecondary: .white
    secondaryContainer: Color(0xFF248FF1)
)
```


## Understanding the Color Palette
The ThemeUI color palette is extensive to allow you to fully express the unique
nature of your app and brand. To organize the palette, colors are broken up into
a few categories, and each category may define multiple color variations.

### Categories
Colors are grouped in to categories to provide semantics. Each category
may have more than one color variation.
- **Primary** - Your primary brand color.
- **Secondary** - Your secondary brand color.
- **Tertiary** - A third brand color, or a color for highlights and accents.
- **Surface** - A color for backgrounds and standard containers.
- **Error** - A color for displaying errors and error messaging.
- **Outline** - A color for drawing outlines around elements.
- **Scrim** - A color for rendering opaque scrims behind modal content.

### Variations
Most color categories provide several variations for a color in addition to 
the core category color.
- **on**: An "on" color defines the color that should be used for content (text, etc) that is rendered __on__ the core category color.
  For example if your `primary` color is a dark green, then your `onPrimary` color would likely be a very light/white color.
- **container**:  A "Container" color defines a color that is used as a background color for a section of content that should be highlighted.
  For exmaple, the `primaryContainer` color might define an alternate shade of your `primary` color that is suitable for use as a background color
     for a large section of content.
 - **inverse**: An "inverse" color defines a color that is "inverted" for a given color mode.
   For exmaple, if you define a light colored `surface` color for backgrounds in light mode, you might define `inverseSurface` to provide an alternate
       for rendering a dark background while still in light mode.
   Note that `inverse` colors are not used to handle light/dark mode changes.

