## system_colours
[juce](https://github.com/WeAreROLI/JUCE) module for accessing native system colours. currently only macos and ios
are supported (prs happily accepted for windows / android). it includes the
following classes:

### ColourConverter
provides a static method to convert between native color formats (`NSColor` / `UIColor` )
and `juce::Colour`.

### StandardColours
provides static methods to access the standard colors from
[macos](https://developer.apple.com/documentation/appkit/nscolor/standard_colors?language=objc)
and [ios](https://developer.apple.com/documentation/uikit/uicolor/standard_colors?language=objc)

### UIElementColors
provides static methods to access the the ui element colors from
[macos](https://developer.apple.com/documentation/appkit/nscolor/ui_element_colors?language=objc)
and
[ios](https://developer.apple.com/documentation/uikit/uicolor/ui_element_colors?language=objc).
note that while there is some overlap both platforms don't support the same
full list of colors.



