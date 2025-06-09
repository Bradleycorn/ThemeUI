
# Color Considerations
Things to consider when it comes to defining your app's colors.


## Overview
ThemeUI is agnostic about the way you define your colors. You are free to use Asset Catalogs, UIColors, or SwiftUI Colors. 
We feel that creating colors in code (as SwiftUI colors) has distinct advantages over using the Asset 
Catalog or other methods for color definition. And ThemeUI makes managing colors for <doc:LightDarkMode> (light/dark mode)
just as easy (if not more-so) that using an Asset Catalog for colors. The sections below outline the reasons why 
we feel that defining colors in code is "the SwiftUI Way". 

### Colors are UI (Views)
The primary reason for using SwiftUI to build your app, and the reason why it is so popular, 
is that it is a declarative UI framework. The benefit of a declarative UI framework, is that your UI is defined 
in code. This has a myriad of advantages over traditional imperative UI frameworks, in which UI's are defined 
in separate files like storyboards, Asset Catalogs, etc. 

So, with SwiftUI Views are defined in code ... And colors _ARE_ Views! SwiftUI itself drives this point home. `Color` itself implements the `View` protocol. `Color` _IS_ a view!

This example shows that Color is UI, rendering a red square on the screen. 
```
struct MyView: View {
   var body: some View {
       Color(.red)
   }
}
```

So, if color _is_ a View, and the goal of SwiftUI is to define Views in code, then it's easy to argue that we 
should define our colors in code as well. 

### Asset Catalogs Can Be Difficult to Maintain
One often proposed benefit of defining colors in an asset catalog is that you can define light and dark mode 
versions of a color in one place, and your app will automatically use the right color. But managing colors like 
his presents a maintenance issue. Instead of defining a single, distinct color value that you then use in a semantic 
color system, you have to define your semantic colors in the Asset Catalog. For example, your catalog will need to 
have a color called `Surface`, and you'll set it's light mode value to something like #EFEFEF, and it's dark mode 
value to someting like #0A0A0A. That's not terrible. But, you are very likely to repeat one of those colors in 
several of your semantically named color values. For example, your `InverseSurface` color for light mode might 
use the same #0A0A0A color. Or maybe you want to use the same exact color for both `Primary` and `PrimaryContainer`. 
If your design team changes a color, you have to go through your entire Asset Catalog looking for it and replacing it. 
If you miss a spot, you'll have the wrong color in your app! 

By defining colors in code, we can define constants for each physical color so that a color is defined in exactly one
place. Then we can apply those colors to our ThemeUI color palette to get semantic theming. For example:

```swift
let lightBlue = Color(0xFF248FF1)

// ...

let myColors = lightColorScheme(primary: lightBlue)
ThemedView(colors: myColors) {
   AppContent()
}
```
Now, our light blue color is defined in exactly one place. If our designer gives us an update, it's easy to find and change.

### Asset Catalog Colors are Error Prone with SwiftUI

> Note: Xcode 15 introduces support for accessing Asset Catalog colors using enum syntax (`Color(.yourColorName)`). That largely eliminates the disadvantage discussed in this section.

Another disadvantage to defining colors in an Asset Catalog, is that to reference those colors as SwiftUI colors, 
you have to use string to reference the asset name:

```
let meColor = Color("YourColorName")
```

Using strings to reference values is error prone in many ways, from misspellings leading to an invalid value, or typos that 
actually reference another defined color and not the one intended.

### Color Math

Defining your colors in code as SwiftUI colors has another advantage ... the ability to do "color math". 
When working with color, you may need to do things like composite a semi-transparent color over another 
color. Or calculate the luminance of a color so that you can render an appropriate color (white or black) 
on top of a color to satisfy accessibility requirements. When you define colors in an Asset Catalog, 
you often times cannot do this color math, because it requires access to the individual color componenets 
(Red, Green, Blue, and opacity values) and you cannot get these values from a Color that was created from an 
Asset Catalog. However, if you create your colors in code directly, you can access these values (easily) 
and do any color math that is neccessary in your app. 
