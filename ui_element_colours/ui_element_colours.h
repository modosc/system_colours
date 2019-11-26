#pragma once
// from https://philjordan.eu/article/mixing-objective-c-c++-and-objective-c++

#ifdef __OBJC__
#define OBJC_CLASS(name) @class name;
#else
#define OBJC_CLASS(name) typedef struct objc_object name;
#endif

#if JUCE_MAC
#define COLOR_CLASS NSColor
#elif JUCE_IOS
#define COLOR_CLASS UIColor
#endif

OBJC_CLASS(COLOR_CLASS)

// macro to generate color wrapper declarations
#define DECLARE_WRAPPED_COLOR(name) static juce::Colour name##Colour();

// macro to generate color wrapper method calls
#define WRAPPED_COLOR(name) juce::Colour UIElementColours::name##Colour() {\
  return UIElementColours::systemColorToColour([COLOR_CLASS name##Color]);\
}

// macro to generate color wrapper methods for properties that aren't implemented
// TODO - can't we do this with objc metaprogramming?
#define WRAPPED_UNIMPLEMENTED_COLOR(name) juce::Colour UIElementColours::name##Colour() {\
  DBG("Platform doesn't implement name##Color, returning empty juce::Colour");\
  return juce::Colour();\
}

// macro to generate color wrapper methods which depend on specific platform versions
#if JUCE_MAC
#define APPLE_OS_NAME macOS
#elif JUCE_IOS
#define APPLE_OS_NAME iOS
#endif

#define WRAPPED_VERSIONED_COLOR(name, version) juce::Colour UIElementColours::name##Colour() {\
  if (@available(APPLE_OS_NAME version, *)) {\
    return UIElementColours::systemColorToColour([COLOR_CLASS name##Color]);\
  } else {\
    DBG("Platform version doesn't support name, returning empty juce::Colour");\
    return juce::Colour();\
  }\
}

class UIElementColours
{
public:
  static juce::Colour systemColorToColour(COLOR_CLASS *);

  // Common Colors:

  // Label Colors

  // The color for text labels that contain primary content.
  DECLARE_WRAPPED_COLOR(label)
  // The color for text labels that contain secondary content.
  DECLARE_WRAPPED_COLOR(secondaryLabel)
  // The color for text labels that contain tertiary content.
  DECLARE_WRAPPED_COLOR(tertiaryLabel)
  // The color for text labels that contain quaternary content..
  DECLARE_WRAPPED_COLOR(quaternaryLabel)

  // Text Colors

  // The color to use for placeholder text in controls or text views.
  DECLARE_WRAPPED_COLOR(placeholderText)

  // Link Color

  // The color to use for links.
  DECLARE_WRAPPED_COLOR(link)

  // Separator Colors

  // The color to use for separators between different sections of content.
  DECLARE_WRAPPED_COLOR(separator)


  // iOS colors

  // An overlay fill color for thin and small shapes.
  DECLARE_WRAPPED_COLOR(systemFill)
  // An overlay fill color for medium-size shapes
  DECLARE_WRAPPED_COLOR(secondarySystemFill)
  // An overlay fill color for large shapes.
  DECLARE_WRAPPED_COLOR(tertiarySystemFill)
  // An overlay fill color for large areas that contain complex content.
  DECLARE_WRAPPED_COLOR(quaternarySystemFill)

  // Standard Content Background Colors

  // The color for the main background of your interface.
  DECLARE_WRAPPED_COLOR(systemBackground)
  // The color for content layered on top of the main background.
  DECLARE_WRAPPED_COLOR(secondarySystemBackground)
  // The color for content layered on top of secondary backgrounds.
  DECLARE_WRAPPED_COLOR(tertiarySystemBackground)

  // Grouped Content Background Colors

  // The color for the main background of your grouped interface.
  DECLARE_WRAPPED_COLOR(systemGroupedBackground)
  // The color for content layered on top of the main background of your grouped interface.
  DECLARE_WRAPPED_COLOR(secondarySystemGroupedBackground)
  // The color for content layered on top of secondary backgrounds of your grouped interface.
  DECLARE_WRAPPED_COLOR(tertiarySystemGroupedBackground)

  // Separator Colors

  // The color for borders or divider lines that hides any underlying content.
  DECLARE_WRAPPED_COLOR(opaqueSeparator)

  // Nonadaptable Colors

  // The nonadaptable system color for text on a light background.
  DECLARE_WRAPPED_COLOR(darkText)
  // The nonadaptable system color for text on a dark background.
  DECLARE_WRAPPED_COLOR(lightText)


  // MacOS Colors

  // Text Colors

  // The color to use for text.
  DECLARE_WRAPPED_COLOR(text)
  // The color to use for selected text.
  DECLARE_WRAPPED_COLOR(selectedText)
  // The color to use for the background area behind text.
  DECLARE_WRAPPED_COLOR(textBackground)
  // The color to use for the background of selected text.
  DECLARE_WRAPPED_COLOR(selectedTextBackground)
  // The color to use for the keyboard focus ring around controls.
  DECLARE_WRAPPED_COLOR(keyboardFocusIndicator)
  // The color to use for selected text in an unemphasized context.
  DECLARE_WRAPPED_COLOR(unemphasizedSelectedText)
  // The color to use for the text background in an unemphasized context.
  DECLARE_WRAPPED_COLOR(unemphasizedSelectedTextBackground)

  // Content Colors

  // The color to use for the background of selected and emphasized content.
  DECLARE_WRAPPED_COLOR(selectedContentBackground)
  // The color to use for selected and unemphasized content.
  DECLARE_WRAPPED_COLOR(unemphasizedSelectedContentBackground)

  // Menu Colors

  // The color to use for the text in menu items.
  DECLARE_WRAPPED_COLOR(selectedMenuItemText)

  // Table Colors

  // The color to use for the optional gridlines, such as those in a table view.
  DECLARE_WRAPPED_COLOR(grid)
  // The color to use for text in header cells in table views and outline views.
  DECLARE_WRAPPED_COLOR(headerText)

  // TODO - how to implement this?
  // DECLARE_WRAPPED_COLOR(alternatingContentBackgroundColors);
  // The colors to use for alternating content, typically found in table views and collection views.

  // Control Colors

  // The user's current accent color preference.
  DECLARE_WRAPPED_COLOR(controlAccent)
  // The color to use for the flat surfaces of a control.
  DECLARE_WRAPPED_COLOR(control)
  // The color to use for the background of large controls, such as scroll views or table views.
  DECLARE_WRAPPED_COLOR(controlBackground)
  // The color to use for text on enabled controls.
  DECLARE_WRAPPED_COLOR(controlText)
  // The color to use for text on disabled controls.
  DECLARE_WRAPPED_COLOR(disabledControlText)
  // The current system control tint color.
  // DECLARE_WRAPPED_COLOR(currentControlTint)
  // The color to use for the face of a selected control—that is, a control that has been clicked or is being dragged.
  DECLARE_WRAPPED_COLOR(selectedControl)
  // The color to use for text in a selected control—that is, a control being clicked or dragged.
  DECLARE_WRAPPED_COLOR(selectedControlText)
  // The color to use for text in a selected control.
  DECLARE_WRAPPED_COLOR(alternateSelectedControlText)
  // The patterned color to use for the background of a scrubber control.
  DECLARE_WRAPPED_COLOR(scrubberTexturedBackground)

  // Window Colors

  // The color to use for the window background.
  DECLARE_WRAPPED_COLOR(windowBackground)
  // The color to use for text in a window's frame.
  DECLARE_WRAPPED_COLOR(windowFrameText)
  // The color to use in the area beneath your window's views.
  DECLARE_WRAPPED_COLOR(underPageBackground)

  // Highlights and Shadows

  // The highlight color to use for the bubble that shows inline search result values.
  DECLARE_WRAPPED_COLOR(findHighlight)
  // The color to use as a virtual light source on the screen.
  DECLARE_WRAPPED_COLOR(highlight)
  // The color to use for virtual shadows cast by raised objects on the screen.
  DECLARE_WRAPPED_COLOR(shadow)
};


