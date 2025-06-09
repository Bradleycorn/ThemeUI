#  Multiple Themes
Using multiple themes and/or nesting themes in an app.

## Overview
Because `ThemedView` is just a regular SwiftUI container view, you are not limited to having one theme in your app. 
You can define multiple themes and use them throughout your app to affect the look and feel. 

Some use cases might be:
- Each section of your app has a different color scheme.
  - You can define a separate theme for each section (you could share type and shapes between them), and wrap each section in its own Theme.

- Most sections of your app use one theme, but one or two sections use a different theme, where your primary brand color serves as the main background color for section content.

```swift
let articleColors = lightColorScheme(...)
let promotionColors = lightColorScheme(...)


struct ArticleScreen: some View {
    var body: some View {
        ThemedView(colors: articleColors) {
            ArticleList()
        }
    }
}

struct PromotionsScreen: some View {
    var body: some View {
        ThemedView(colors: promotionColors) {
            PromotionsList()
        }
    }
}

```


- With a single theme, you can support multiple app targets in a single project. Each target can define it's own set of colors, type, and/or shapes, then a single `ThemedView` in shared/common code can apply theming for the target it's running in.

```swift
// First Target
let appColors = lightColorScheme(primary: .blue)


// Second Target
let appColors = lightColorScheme(primary: .red)



// Shared file in both Targets
@main
struct MyApp: App {

    var body: some Scene {
        WindowGroup {
            ThemedView(colors: appColors) {
                AppContent
            }
        }
    }
}
```
