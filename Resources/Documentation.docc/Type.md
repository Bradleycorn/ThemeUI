#  Typography
Use Typography to apply fonts consistently throughout your app. 

## Overview
ThemeUI exposes a set of semantically named typography values via the ``Typography`` object. Types fall into one of several categories, and each category provides small, medium, and large variations.

> Warning: The `Typography` class is a work in progress, and will likely undergo
signifcant changes to better support dynamic type and leverage SwiftUI's
built-in type styles. 

### Categories
- **Display**: The largest text on the screen, display styles are reserved for short, important text or numerals.
- **Headline**: Headlines are best-suited for short, high-emphasis text
- **Title**: Titles are smaller than headline styles, and should be used for medium-emphasis text that remains relatively short.
- **Body**: Body styles are used for longer passages of text in your app.
- **Label**: Label styles are smaller, utilitarian styles, used for things like the text inside components or for very small text in the content body, such as captions.

ThemeUI comes with a sane set of default typography, created by creating an instance of the Typography class;

```swift
let myDefaultType = Typography()
```

Alternatively, you can pass in Fonts for some or all of the parameters to customize the Type system:

```swift
let myCustomType = Typography(
       headlineLarge: Font.system(size: 32, weight: .medium),
       headlineSmall: Font.system(size: 24, weight: .medium)
)
```
