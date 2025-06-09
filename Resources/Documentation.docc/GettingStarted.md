# Getting Started
Using ThemeUI in your app.

## Overview

ThemeUI works by wrapping your app content in a ``ThemedView``. 

```swift
@main
struct MyAwesomeApp: App {
    
    var body: some Scene {
        WindowGroup {
            ThemedView {
                AppContent()
            }
        }
    }
}
```

``ThemedView`` sets an ``AppTheme`` `EnvrionmentObject` that contains 
the colors, typography, and shapes for your theme.
Use theme properties to style your app's views appropriately. 

The following example uses color, type, and shape elements from the 
theme to apply a background color, rounded corners, and content color
to the view. 

```swift
struct AppContent: View {
    @EnvironmentObject 
    private var theme: AppTheme

    var body: some View {
        ZStack {
            theme.colorScheme.primaryContainer
            Text("Hello Themed App")
                .foregroundStyle(theme.colorScheme.onPrimary)
        }
        .frame(width: 200, height: 100)
        .clipShape(theme.shapes.medium)
    }
}

```

![Basic Theme View](basic-themed-view)
