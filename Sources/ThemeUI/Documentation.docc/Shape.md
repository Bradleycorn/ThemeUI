#  Shape
Use Shapes to adjust the outline and borders of your views.

ThemeUI exposes a set of semantically named shape values via the ``Shapes`` class. 
Shapes define an overall shape for a view, such as regtangluar, rounded corners, capsules, circular, etc. 

> Warning: The Shapes system is under heavy development. 

There are thee sizes of shapes:

- **Small** - For use with small elements like chips or checkboxes. 
- **Medium** - For use with medium elements like cards
- **Large** - For use with large elements like dialogs and bottom sheets.

When defining a set of shapes _do not_ think in terms of roundedness, where `small` means "a little bit of rounding", and `large` means "a lot of rounding".
That defeats the purpose of a semantic naming system for shapes. Intead think in terms of element/view size: `small` means "a small view, possibly shown in line with other content", 
and `large` means "a large view that covers most of the screen". 

ThemeUI comes with a sane set of default shapes, created by creating an instance of the `Shapes` class;
```swift
let myDefaultShapes = Shapes()
```

Alternatively, you can pass in Shapes for some or all of the parameters to customize the Shape system:
```swift
let myCustomShapes = Shapes(
       small: .capsule,
       medium: RoundedRectangle(cornerRadius: 12),
       large: Rectangle()
)
```

