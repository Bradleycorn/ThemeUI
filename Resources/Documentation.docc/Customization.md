#  Customizing Your Theme
Using your own colors, type faces, and shapes in your theme.

## Overview
The purpose of a theme is to provide a customized look and feel to your app. 
If you wanted to use default theming, you wouldn't need ThemeUI at all! Lets
look at the areas in which you can customize your app theme. 

### Colors
ThemeUI provides a rich color pallette with semantic color names
via the <doc:Colors> class. Colors fall into one of several categories, and categories
may define one or more color variants. Apply your primary, secondary, and tertiary
brand colors, as well as customing colors for common elements such as backgrounds,
surfaces, and outlines.

See <doc:Color> for more on defining a color palette for your app.

### Typography
The <doc:Typography> class defines a set of typefaces with semantic names to assist you 
applying consistent typography throughout your app. 

> Warning: The `Typography` class is a work in progress, and will likely undergo
signifcant changes to better support dynamic type and better leverage SwiftUI's
built-in type styles. 

See <doc:Type> for more on defining typography for your app.

### Shapes
The <doc:Shapes> class defines a set of `Shape` styles that you can apply to your views. 
Often times, shapes will take the form of adding rounded corners to the views 
which they are applied, but this does not have to be a hard and fast rule. 

ThemeUI provides shapes styles to be applied based on the overall size of the view
being shaped (small, medium, large, etc).

See <doc:Shape> for more on defining shapes for your app.

## Applying Customizations

To use your custom Colors, Typography, and/or Shapes in your app, pass them to the ``ThemedView`` that wraps your app content:

```swift
var body: some Scene {
    WindowGroup {
        ThemedView(colors: Colors(...), typography: Typography(...), shapes: Shapes(...)) {
            AppContent()
        }
    }
}
```


