#import "ui_element_colours.h"
#include "../colour_converter/colour_converter.h"

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <AppKit/AppKit.h>


// macro to generate color wrapper method calls
#define WRAPPED_UI_ELEMENT_COLOR(name) juce::Colour UIElementColours::name##Colour() {\
  return ColourConverter::convert([COLOR_CLASS name##Color]);\
}

// macro to generate color wrapper methods for properties that aren't implemented
// TODO - can't we do this with objc metaprogramming?
#define WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(name) juce::Colour UIElementColours::name##Colour() {\
  DBG("Platform doesn't implement name##Color, returning empty juce::Colour");\
  return juce::Colour();\
}

#define WRAPPED_VERSIONED_UI_ELEMENT_COLOR(name, version) juce::Colour UIElementColours::name##Colour() {\
  if (@available(macOS version, *)) {\
    return ColourConverter::convert([COLOR_CLASS name##Color]);\
  } else {\
    DBG("Platform version doesn't support name, returning empty juce::Colour");\
    return juce::Colour();\
  }\
}


juce::LookAndFeel_V4::ColourScheme UIElementColours::getSystemColourScheme()
{
  return
  {
    // windowBackground
    UIElementColours::windowBackgroundColour(),
    // widgetBackground
    UIElementColours::quaternaryLabelColour(),
    // menuBackground
    UIElementColours::tertiaryLabelColour(),
    // outline
    UIElementColours::keyboardFocusIndicatorColour(),
    // defaultText
    UIElementColours::textColour(),
    // defaultFill
    UIElementColours::textBackgroundColour(),
    // highlightedText
    UIElementColours::selectedTextColour(),
    // highlightedFill
    UIElementColours::selectedTextBackgroundColour(),
    // menuText
    UIElementColours::textColour(),
  };

}


// Common Colors:

// Label Colors

// The color for text labels that contain primary content.
WRAPPED_UI_ELEMENT_COLOR(label)
// The color for text labels that contain secondary content.
WRAPPED_UI_ELEMENT_COLOR(secondaryLabel)
// The color for text labels that contain tertiary content.
WRAPPED_UI_ELEMENT_COLOR(tertiaryLabel)
// The color for text labels that contain quaternary content..
WRAPPED_UI_ELEMENT_COLOR(quaternaryLabel)

// Text Colors

// The color to use for placeholder text in controls or text views.
WRAPPED_UI_ELEMENT_COLOR(placeholderText)

// Link Color

// The color to use for links.
WRAPPED_UI_ELEMENT_COLOR(link)

// Separator Colors

// The color to use for separators between different sections of content.
WRAPPED_VERSIONED_UI_ELEMENT_COLOR(separator, 10.14)


// iOS colors

// An overlay fill color for thin and small shapes.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(systemFill)
// An overlay fill color for medium-size shapes
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(secondarySystemFill)
// An overlay fill color for large shapes.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(tertiarySystemFill)
// An overlay fill color for large areas that contain complex content.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(quaternarySystemFill)

// Standard Content Background Colors

// The color for the main background of your interface.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(systemBackground)
// The color for content layered on top of the main background.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(secondarySystemBackground)
// The color for content layered on top of secondary backgrounds.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(tertiarySystemBackground)

// Grouped Content Background Colors

// The color for the main background of your grouped interface.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(systemGroupedBackground)
// The color for content layered on top of the main background of your grouped interface.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(secondarySystemGroupedBackground)
// The color for content layered on top of secondary backgrounds of your grouped interface.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(tertiarySystemGroupedBackground)

// Separator Colors

// The color for borders or divider lines that hides any underlying content.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(opaqueSeparator)

// Nonadaptable Colors

// The nonadaptable system color for text on a light background.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(darkText)
// The nonadaptable system color for text on a dark background.
WRAPPED_UNIMPLEMENTED_UI_ELEMENT_COLOR(lightText)


// MacOS Colors

// Text Colors

// The color to use for text.
WRAPPED_UI_ELEMENT_COLOR(text)
// The color to use for selected text.
WRAPPED_UI_ELEMENT_COLOR(selectedText)
// The color to use for the background area behind text.
WRAPPED_UI_ELEMENT_COLOR(textBackground)
// The color to use for the background of selected text.
WRAPPED_UI_ELEMENT_COLOR(selectedTextBackground)
// The color to use for the keyboard focus ring around controls.
WRAPPED_UI_ELEMENT_COLOR(keyboardFocusIndicator)
// The color to use for selected text in an unemphasized context.
WRAPPED_VERSIONED_UI_ELEMENT_COLOR(unemphasizedSelectedText, 10.14)
// The color to use for the text background in an unemphasized context.
WRAPPED_VERSIONED_UI_ELEMENT_COLOR(unemphasizedSelectedTextBackground, 10.14)

// Content Colors

// The color to use for the background of selected and emphasized content.
WRAPPED_VERSIONED_UI_ELEMENT_COLOR(selectedContentBackground, 10.14)
// The color to use for selected and unemphasized content.
WRAPPED_VERSIONED_UI_ELEMENT_COLOR(unemphasizedSelectedContentBackground, 10.14)

// Menu Colors

// The color to use for the text in menu items.
WRAPPED_UI_ELEMENT_COLOR(selectedMenuItemText)

// Table Colors

// The color to use for the optional gridlines, such as those in a table view.
WRAPPED_UI_ELEMENT_COLOR(grid)
// The color to use for text in header cells in table views and outline views.
WRAPPED_UI_ELEMENT_COLOR(headerText)

// TODO - how to implement this?
// WRAPPED_UI_ELEMENT_COLOR(alternatingContentBackgroundColors);
// The colors to use for alternating content, typically found in table views and collection views.

// Control Colors

// The user's current accent color preference.
WRAPPED_VERSIONED_UI_ELEMENT_COLOR(controlAccent, 10.14)
// The color to use for the flat surfaces of a control.
WRAPPED_UI_ELEMENT_COLOR(control)
// The color to use for the background of large controls, such as scroll views or table views.
WRAPPED_UI_ELEMENT_COLOR(controlBackground)
// The color to use for text on enabled controls.
WRAPPED_UI_ELEMENT_COLOR(controlText)
// The color to use for text on disabled controls.
WRAPPED_UI_ELEMENT_COLOR(disabledControlText)
// The current system control tint color.
// WRAPPED_UI_ELEMENT_COLOR(currentControlTint)
// The color to use for the face of a selected control—that is, a control that has been clicked or is being dragged.
WRAPPED_UI_ELEMENT_COLOR(selectedControl)
// The color to use for text in a selected control—that is, a control being clicked or dragged.
WRAPPED_UI_ELEMENT_COLOR(selectedControlText)
// The color to use for text in a selected control.
WRAPPED_UI_ELEMENT_COLOR(alternateSelectedControlText)
// The patterned color to use for the background of a scrubber control.
WRAPPED_UI_ELEMENT_COLOR(scrubberTexturedBackground)

// Window Colors

// The color to use for the window background.
WRAPPED_UI_ELEMENT_COLOR(windowBackground)
// The color to use for text in a window's frame.
WRAPPED_UI_ELEMENT_COLOR(windowFrameText)
// The color to use in the area beneath your window's views.
WRAPPED_UI_ELEMENT_COLOR(underPageBackground)

// Highlights and Shadows

// The highlight color to use for the bubble that shows inline search result values.
WRAPPED_VERSIONED_UI_ELEMENT_COLOR(findHighlight, 10.13)
// The color to use as a virtual light source on the screen.
WRAPPED_UI_ELEMENT_COLOR(highlight)
// The color to use for virtual shadows cast by raised objects on the screen.
WRAPPED_UI_ELEMENT_COLOR(shadow)
