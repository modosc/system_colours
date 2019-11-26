#import "ui_element_colours.h"

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <AppKit/AppKit.h>

// NSColor has a number of methods that return system colors (i.e. controlled by
// user preferences). This function converts the color given by an NSColor class
// method to a juce::Colour.
//
// mostly taken from
// https://chromium.googlesource.com/chromium/src/+/lkgr/ui/native_theme/native_theme_mac.mm
// https://github.com/adobe/chromium/blob/master/skia/ext/skia_utils_mac.mm
juce::Colour UIElementColours::systemColorToColour(NSColor *nsColor)
{
  // System colors use the an NSNamedColorSpace called "System", so first step
  // is to convert the color into something that can be worked with.
  NSColor* deviceColor =
  [nsColor colorUsingColorSpace:[NSColorSpace deviceRGBColorSpace]];
  if (deviceColor)
  {
    CGFloat red, green, blue, alpha;
    [deviceColor getRed:&red green:&green blue:&blue alpha:&alpha];
    return juce::Colour::fromFloatRGBA((float) red, (float) green, (float) blue, (float) alpha);
  }

  // Sometimes the conversion is not possible, but we can get an approximation
  // by going through a CGColorRef. Note that simply using NSColor methods for
  // accessing components for system colors results in exceptions like
  // "-numberOfComponents not valid for the NSColor NSNamedColorSpace System
  // windowBackgroundColor; need to first convert colorspace." Hence the
  // conversion first to CGColor.

  CGColorRef cgColor = [nsColor CGColor];
  const size_t componentCount = CGColorGetNumberOfComponents(cgColor);

  if (componentCount == 4)
  {
    const CGFloat* components = CGColorGetComponents(cgColor);
    return juce::Colour((float) components[0], (float) components[1], (float) components[2], (float) components[3]);
  }
  // 1-2 components means a grayscale channel and maybe an alpha channel, which
  // CGColorRefToSkColor will not like. But RGB is additive, so the conversion
  // is easy (RGB to grayscale is less easy).

  if (componentCount != 1 && componentCount != 2)
  {
    // no idea what kind of color format this is, return an empty juce colour and trigger an assertion failure in development
    jassert(false);
    return juce::Colour();
  }
  const CGFloat* components = CGColorGetComponents(cgColor);
  CGFloat alpha = componentCount == 2 ? components[1] : 1.0;
  return juce::Colour::fromFloatRGBA((float) components[0], (float) components[0], (float) components[0], (float) alpha);
}


// Common Colors:

// Label Colors

// The color for text labels that contain primary content.
WRAPPED_COLOR(label)
// The color for text labels that contain secondary content.
WRAPPED_COLOR(secondaryLabel)
// The color for text labels that contain tertiary content.
WRAPPED_COLOR(tertiaryLabel)
// The color for text labels that contain quaternary content..
WRAPPED_COLOR(quaternaryLabel)

// Text Colors

// The color to use for placeholder text in controls or text views.
WRAPPED_COLOR(placeholderText)

// Link Color

// The color to use for links.
WRAPPED_COLOR(link)

// Separator Colors

// The color to use for separators between different sections of content.
WRAPPED_VERSIONED_COLOR(separator, 10.14)


// iOS colors

// An overlay fill color for thin and small shapes.
WRAPPED_UNIMPLEMENTED_COLOR(systemFill)
// An overlay fill color for medium-size shapes
WRAPPED_UNIMPLEMENTED_COLOR(secondarySystemFill)
// An overlay fill color for large shapes.
WRAPPED_UNIMPLEMENTED_COLOR(tertiarySystemFill)
// An overlay fill color for large areas that contain complex content.
WRAPPED_UNIMPLEMENTED_COLOR(quaternarySystemFill)

// Standard Content Background Colors

// The color for the main background of your interface.
WRAPPED_UNIMPLEMENTED_COLOR(systemBackground)
// The color for content layered on top of the main background.
WRAPPED_UNIMPLEMENTED_COLOR(secondarySystemBackground)
// The color for content layered on top of secondary backgrounds.
WRAPPED_UNIMPLEMENTED_COLOR(tertiarySystemBackground)

// Grouped Content Background Colors

// The color for the main background of your grouped interface.
WRAPPED_UNIMPLEMENTED_COLOR(systemGroupedBackground)
// The color for content layered on top of the main background of your grouped interface.
WRAPPED_UNIMPLEMENTED_COLOR(secondarySystemGroupedBackground)
// The color for content layered on top of secondary backgrounds of your grouped interface.
WRAPPED_UNIMPLEMENTED_COLOR(tertiarySystemGroupedBackground)

// Separator Colors

// The color for borders or divider lines that hides any underlying content.
WRAPPED_UNIMPLEMENTED_COLOR(opaqueSeparator)

// Nonadaptable Colors

// The nonadaptable system color for text on a light background.
WRAPPED_UNIMPLEMENTED_COLOR(darkText)
// The nonadaptable system color for text on a dark background.
WRAPPED_UNIMPLEMENTED_COLOR(lightText)


// MacOS Colors

// Text Colors

// The color to use for text.
WRAPPED_COLOR(text)
// The color to use for selected text.
WRAPPED_COLOR(selectedText)
// The color to use for the background area behind text.
WRAPPED_COLOR(textBackground)
// The color to use for the background of selected text.
WRAPPED_COLOR(selectedTextBackground)
// The color to use for the keyboard focus ring around controls.
WRAPPED_COLOR(keyboardFocusIndicator)
// The color to use for selected text in an unemphasized context.
WRAPPED_VERSIONED_COLOR(unemphasizedSelectedText, 10.14)
// The color to use for the text background in an unemphasized context.
WRAPPED_VERSIONED_COLOR(unemphasizedSelectedTextBackground, 10.14)

// Content Colors

// The color to use for the background of selected and emphasized content.
WRAPPED_VERSIONED_COLOR(selectedContentBackground, 10.14)
// The color to use for selected and unemphasized content.
WRAPPED_VERSIONED_COLOR(unemphasizedSelectedContentBackground, 10.14)

// Menu Colors

// The color to use for the text in menu items.
WRAPPED_COLOR(selectedMenuItemText)

// Table Colors

// The color to use for the optional gridlines, such as those in a table view.
WRAPPED_COLOR(grid)
// The color to use for text in header cells in table views and outline views.
WRAPPED_COLOR(headerText)

// TODO - how to implement this?
// WRAPPED_COLOR(alternatingContentBackgroundColors);
// The colors to use for alternating content, typically found in table views and collection views.

// Control Colors

// The user's current accent color preference.
WRAPPED_VERSIONED_COLOR(controlAccent, 10.14)
// The color to use for the flat surfaces of a control.
WRAPPED_COLOR(control)
// The color to use for the background of large controls, such as scroll views or table views.
WRAPPED_COLOR(controlBackground)
// The color to use for text on enabled controls.
WRAPPED_COLOR(controlText)
// The color to use for text on disabled controls.
WRAPPED_COLOR(disabledControlText)
// The current system control tint color.
// WRAPPED_COLOR(currentControlTint)
// The color to use for the face of a selected control—that is, a control that has been clicked or is being dragged.
WRAPPED_COLOR(selectedControl)
// The color to use for text in a selected control—that is, a control being clicked or dragged.
WRAPPED_COLOR(selectedControlText)
// The color to use for text in a selected control.
WRAPPED_COLOR(alternateSelectedControlText)
// The patterned color to use for the background of a scrubber control.
WRAPPED_COLOR(scrubberTexturedBackground)

// Window Colors

// The color to use for the window background.
WRAPPED_COLOR(windowBackground)
// The color to use for text in a window's frame.
WRAPPED_COLOR(windowFrameText)
// The color to use in the area beneath your window's views.
WRAPPED_COLOR(underPageBackground)

// Highlights and Shadows

// The highlight color to use for the bubble that shows inline search result values.
WRAPPED_VERSIONED_COLOR(findHighlight, 10.13)
// The color to use as a virtual light source on the screen.
WRAPPED_COLOR(highlight)
// The color to use for virtual shadows cast by raised objects on the screen.
WRAPPED_COLOR(shadow)
