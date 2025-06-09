# ThemeUI
ThemeUI is a framework that provides an easy to use system for applying semantic colors, types, and shapes throughout the application. 
It is designed to _compliment_ the iOS and SwiftUI tools for setting and applying colors and type, and is **not meant to replace** or work against
the built-in styling capabilities of SwiftUI. 

ThemeUI also aims to be a **generic** tool that could be used in ANY iOS app, and does not contain code that is specific to this project. Indeed,
we should be able to break this framework out and publish it as it's own independant framework that could be used in _any_ iOS app. While we will
very likely write code that is specfic to this app and very closely coupled with ThemeUI components, this code should NOT go into the ThemeUI framework,
and instead should go into the `App` code. 

For example, ThemeUI provides a set of button styles (that implement the SwiftUI `ButtonStyle` protocol) for Filled, Outlined, and Text Buttons. 
These styles work with a passed in set of `ButtonColors` and `Shape`. ThemeUI does not provide Button Styles for all theme colors and shapes. 
If you want to apply consistent styling to all buttons in your app (say using the `Filled` style, with your `secondary` color, 
and a RoundedRectangle shape), you should create your own button style in your app that does not take any passed in values, and calls through to the ThemeUI 
ButtonStyle, passing a specific set of Theme-based colors and shape. 

# Documentation
In the XCode project documenation you will find a complete set of documenation for ThemeUI 
including all of it's components. It also includes examples, advice, and best practices for applying themes in your app.

# Usage
Using ThemeUI in your app is actually really simple.

## Basic App Theme

Start by creating an instance of the [`Colors`](Docs/Colors.md) class, and optionally instances of the [`Typography`](Docs/Typography.md), and [`Shapes`](Docs/Shapes.md) classes as well. 
These define the semantic colors, type, and shapes that you will use in your app. 

Then in your app, render an instance of the `ThemedView` view, passing it your colors, types, and shapes. 
Typically, the `ThemedView` will be the root/top-level view in your `@main App`, so that you can apply consistent themeing for the entire app. 

```
@main
struct MyApp: App {
  let myColors = Colors( ... )
  let myType = Typography( ... )
  let myShapes = Shapes( ... )

  var body: some Scene {
    WindowGroup {
      ThemedView(colors: myColors, typography: myType, shapes: myShapes) {
          MyAppContent()
      }
    }
  }
}
```

`ThemedView` does two things:
1. It sets an Environment Object with an instance of `AppTheme`, which exposes the [`Colors`](Docs/Colors.md), [`Typography`](Docs/Typography.md), and [`Shapes`](Docs/Shapes.md) objects that you passed to it.
2. It renders the `Content` that you pass to it via it's `content` closure.

In your app views, You can access the `AppTheme` Environment Object, and use it to access and use your semantic colors, types, and shapes:
```
struct MyAppContent: View {
    @EnvironmentObject
    var theme: AppTheme

    var body: some View {
        Text("Themed Text!")
            .padding(8)
            .background(theme.colorScheme.secondary)
            .foregroundColor(theme.colorScheme.onSecondary)
            .font(theme.typography.headlineMedium)
            .clipShape(theme.shapes.medium)
    }
}

```
The view above uses theme variables to set background and foreground color, the font, and a clipShape for the displayed text view. 
It would render like this:

<img width="218" alt="Screenshot 2024-06-08 at 4 12 21 PM" src="https://github.com/twinspires/Native-iOS/assets/4521694/68d1a710-ce9f-4f9b-85da-209e22333e47">