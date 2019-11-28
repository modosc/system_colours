#import "colour_converter.h"

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
juce::Colour ColourConverter::convert(NSColor *nsColor)
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

