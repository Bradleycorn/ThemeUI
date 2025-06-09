#  Color Modes
Handling Light and Dark mode with ThemeUI

## Overview
If you define your colors in an Asset Catalog, it provides a mechanism for handling light and dark mode
in your app. You can create a single ``Colors`` instance using the colors from your catalog and use it with
a ``ThemedView``.

But if you define your colors in code, as described in <doc:DefiningColors> and <doc:ColorConsiderations>, 
you will need to handle color mode changes yourself. Fortunately SwfitUI and ThemeUI provide tools to make
this a piece of cake.

To support both light and dark mode in your app, you can create a set of ``Colors`` for light mode, and 
another set for dark mode. Then, you can take advantage of SwiftUI's built-in support for light/dark mode 
by defining your own Themed View that switches the color scheme based on the current mode:

```swift
fileprivate let lightColors = lightColorScheme( ... )
fileprivate let darkColors = darkColorScheme( ... )

struct MyAppTheme<Content: View>: View {
    @Environment(\.colorScheme) var colorMode
    
    private let content: () -> Content
       
    init(
        @ViewBuilder content: @escaping ()->Content) {
            self.content = content
    }

    private var appColors: Colors {
      switch(colorMode) {
        case .dark:
          darkColors
        default:
          lightColors
      }
    }

    var body: some View {
        ThemedView(colors: appColors, content: content)
    }
}
```


Now use your new app theme view as the root theme in your app:
```swift
@main
struct MyApp: App {
  var body: some Scene {
    WindowGroup {
      MyAppTheme {
          MyAppContent()
      }
    }
  }
}
```
SwiftUI will automatically re-render your MyAppTheme when the device's color mode changes,
resulting in a new set of ``Colors`` passed to ``ThemedView``, and a new ``AppTheme`` instance
provided to the Environment. Your child views will use the new colors and render in the appropriate
light or dark mode.

