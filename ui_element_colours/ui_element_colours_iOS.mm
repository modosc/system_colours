#import "ui_element_colours.h"

#import <UIKit/UIKit.h>

juce::Colour UIElementColours::systemColorToColour(UIColor *uiColor)
{
  CGFloat red, green, blue, alpha, hue, saturation, brightness, white;
  // unlike AppKit, UIKit returns a boolean if it was successful parsing a color. so we just check the various
  // formats until we find one that matches

  bool result = [uiColor getRed:&red green:&green blue:&blue alpha:&alpha];
  if (result)
    return juce::Colour::fromFloatRGBA((float) red, (float) green, (float) blue, (float) alpha);

  result = [uiColor getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
  if (result)
    return juce::Colour((float) hue, (float) saturation, (float) brightness, (float) alpha);

  result = [uiColor getWhite:&white alpha:&alpha];
  if (result)
    return juce::Colour::fromFloatRGBA((float) white, (float) white, (float) white, (float) alpha);

  // no idea what kind of color format this is, return an empty juce colour and trigger an assertion failure in development
  CGColorRef colorRef = uiColor.CGColor;
  NSString *colorString = [CIColor colorWithCGColor:colorRef].stringRepresentation;

  DBG("Invalid UIColor doesn't support" << std::string([colorString UTF8String]) << ", returning empty juce::Colour");
  return juce::Colour();
}

// Common Colors:

// Label Colors

// The color for text labels that contain primary content.
WRAPPED_VERSIONED_COLOR(label, 13.0)
// The color for text labels that contain secondary content.
WRAPPED_VERSIONED_COLOR(secondaryLabel, 13.0)
// The color for text labels that contain tertiary content.
WRAPPED_VERSIONED_COLOR(tertiaryLabel, 13.0)
// The color for text labels that contain quaternary content..
WRAPPED_VERSIONED_COLOR(quaternaryLabel, 13.0)

// Text Colors

// The color to use for placeholder text in controls or text views.
WRAPPED_VERSIONED_COLOR(placeholderText, 13.0)

// Link Color

// The color to use for links.
WRAPPED_VERSIONED_COLOR(link, 13.0)

// Separator Colors

// The color to use for separators between different sections of content.
WRAPPED_VERSIONED_COLOR(separator, 13.0)


// iOS colors

// An overlay fill color for thin and small shapes.
WRAPPED_VERSIONED_COLOR(systemFill, 13.0)
// An overlay fill color for medium-size shapes
WRAPPED_VERSIONED_COLOR(secondarySystemFill, 13.0)
// An overlay fill color for large shapes.
WRAPPED_VERSIONED_COLOR(tertiarySystemFill, 13.0)
// An overlay fill color for large areas that contain complex content.
WRAPPED_VERSIONED_COLOR(quaternarySystemFill, 13.0)

// Standard Content Background Colors

// The color for the main background of your interface.
WRAPPED_VERSIONED_COLOR(systemBackground, 13.0)
// The color for content layered on top of the main background.
WRAPPED_VERSIONED_COLOR(secondarySystemBackground, 13.0)
// The color for content layered on top of secondary backgrounds.
WRAPPED_VERSIONED_COLOR(tertiarySystemBackground, 13.0)

// Grouped Content Background Colors

// The color for the main background of your grouped interface.
WRAPPED_VERSIONED_COLOR(systemGroupedBackground, 13.0)
// The color for content layered on top of the main background of your grouped interface.
WRAPPED_VERSIONED_COLOR(secondarySystemGroupedBackground, 13.0)
// The color for content layered on top of secondary backgrounds of your grouped interface.
WRAPPED_VERSIONED_COLOR(tertiarySystemGroupedBackground, 13.0)

// Separator Colors

// The color for borders or divider lines that hides any underlying content.
WRAPPED_VERSIONED_COLOR(opaqueSeparator, 13.0)

// Nonadaptable Colors

// The nonadaptable system color for text on a light background.
WRAPPED_COLOR(darkText)
// The nonadaptable system color for text on a dark background.
WRAPPED_COLOR(lightText)


// MacOS Colors

// Text Colors

// The color to use for text.
WRAPPED_UNIMPLEMENTED_COLOR(text)
// The color to use for selected text.
WRAPPED_UNIMPLEMENTED_COLOR(selectedText)
// The color to use for the background area behind text.
WRAPPED_UNIMPLEMENTED_COLOR(textBackground)
// The color to use for the background of selected text.
WRAPPED_UNIMPLEMENTED_COLOR(selectedTextBackground)
// The color to use for the keyboard focus ring around controls.
WRAPPED_UNIMPLEMENTED_COLOR(keyboardFocusIndicator)
// The color to use for selected text in an unemphasized context.
WRAPPED_UNIMPLEMENTED_COLOR(unemphasizedSelectedText)
// The color to use for the text background in an unemphasized context.
WRAPPED_UNIMPLEMENTED_COLOR(unemphasizedSelectedTextBackground)

// Content Colors

// The color to use for the background of selected and emphasized content.
WRAPPED_UNIMPLEMENTED_COLOR(selectedContentBackground)
// The color to use for selected and unemphasized content.
WRAPPED_UNIMPLEMENTED_COLOR(unemphasizedSelectedContentBackground)

// Menu Colors

// The color to use for the text in menu items.
WRAPPED_UNIMPLEMENTED_COLOR(selectedMenuItemText)

// Table Colors

// The color to use for the optional gridlines, such as those in a table view.
WRAPPED_UNIMPLEMENTED_COLOR(grid)
// The color to use for text in header cells in table views and outline views.
WRAPPED_UNIMPLEMENTED_COLOR(headerText)

// TODO - how to implement this?
// DECLARE_WRAPPED_COLOR(alternatingContentBackgroundColors);
// The colors to use for alternating content, typically found in table views and collection views.

// Control Colors

// The user's current accent color preference.
WRAPPED_UNIMPLEMENTED_COLOR(controlAccent)
// The color to use for the flat surfaces of a control.
WRAPPED_UNIMPLEMENTED_COLOR(control)
// The color to use for the background of large controls, such as scroll views or table views.
WRAPPED_UNIMPLEMENTED_COLOR(controlBackground)
// The color to use for text on enabled controls.
WRAPPED_UNIMPLEMENTED_COLOR(controlText)
// The color to use for text on disabled controls.
WRAPPED_UNIMPLEMENTED_COLOR(disabledControlText)
// The current system control tint color.
// DECLARE_WRAPPED_COLOR(currentControlTint)
// The color to use for the face of a selected control—that is, a control that has been clicked or is being dragged.
WRAPPED_UNIMPLEMENTED_COLOR(selectedControl)
// The color to use for text in a selected control—that is, a control being clicked or dragged.
WRAPPED_UNIMPLEMENTED_COLOR(selectedControlText)
// The color to use for text in a selected control.
WRAPPED_UNIMPLEMENTED_COLOR(alternateSelectedControlText)
// The patterned color to use for the background of a scrubber control.
WRAPPED_UNIMPLEMENTED_COLOR(scrubberTexturedBackground)

// Window Colors

// The color to use for the window background.
WRAPPED_UNIMPLEMENTED_COLOR(windowBackground)
// The color to use for text in a window's frame.
WRAPPED_UNIMPLEMENTED_COLOR(windowFrameText)

// The color to use in the area beneath your window's views.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
WRAPPED_COLOR(underPageBackground)
#pragma clang diagnostic pop


// Highlights and Shadows

// The highlight color to use for the bubble that shows inline search result values.
WRAPPED_UNIMPLEMENTED_COLOR(findHighlight)
// The color to use as a virtual light source on the screen.
WRAPPED_UNIMPLEMENTED_COLOR(highlight)
// The color to use for virtual shadows cast by raised objects on the screen.
WRAPPED_UNIMPLEMENTED_COLOR(shadow)
