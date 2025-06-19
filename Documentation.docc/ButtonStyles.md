#  Button Styles
A common set of styles for buttons.


## Overview
Styling for buttons is one of the first and most common ways that theming is applied to apps. 
And in many apps, buttons are styled in one of three general ways:

- **Filled**: A Button with a solid or gradient background applied behind text (and sometimes 
              icon) content. 
- **Outlined**: A button with a transparent background and a border/outline. 
- **Text**: A button with no background fill color or outline, only the text (and/or icon) button content. 

ThemeUI includes ``FilledButtonStyle``, ``OutlinedButtonStyle``, & ``TextButtonStyle`` types 
that implement these common button styles. Each Type conforms to the SwiftUI `ButtonStyle` 
protocol and applies styling using attributes from your ``AppTheme``. Because these styles 
conform to the `ButtonStyle` protocol, you can apply them to your app's Button views in the 
same way you would any other button style:

```swift
Button("Click Me", action: { print("button clicked!") })
    .buttonStyle(FilledButtonStyle())
```

## Customizing Buttons

By default, Buttons are rendered using a set of ``ButtonColors`` based on your theme's
``ColorScheme/primary`` color, and using a consistent `Shape` (defined in ``ButtonDefaults``). 

You can customize styles by passing in a different set of ``ButtonColors`` and/or `Shape` to the
initializer for the Style you are applying:

```swift
@EnvironmentObject
private var theme: AppTheme

let buttonColor = theme.colorScheme.secondary
let textColor = theme.colorScheme.contentColorFor(buttonColor)

let secondaryButtonColors = theme.colorScheme.deaultButtonColors.copy(
    backgroundColor: buttonColor,
    foregroundColor: textColor,
    disabledBackgroundColor: buttonColor.opacity(0.5),
    disabledForegroundColor: textColor.opacity(0.5)
)

Button("Secondary Button", action: { onButtonClick() })
    .buttonStyle(FilledButtonStyle(secondaryButtonColors, shape: theme.shapes.medium))
```
