#import "colour_converter.h"

#import <UIKit/UIKit.h>

juce::Colour ColourConverter::convert(UIColor *uiColor)
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
