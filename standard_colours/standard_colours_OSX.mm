#import "standard_colours.h"
#include "../colour_converter/colour_converter.h"

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <AppKit/AppKit.h>

// macro to generate color wrapper declarations
#define DECLARE_WRAPPED_STANDARD_COLOR(name) static juce::Colour name##Colour();

// macro to generate color wrapper method calls
#define WRAPPED_STANDARD_COLOR(name) juce::Colour StandardColours::name##Colour() {\
  return ColourConverter::convert([COLOR_CLASS name##Color]);\
}

// macro to generate color wrapper methods for properties that aren't implemented
// TODO - can't we do this with objc metaprogramming?
#define WRAPPED_UNIMPLEMENTED_STANDARD_COLOR(name) juce::Colour StandardColours::name##Colour() {\
  DBG("Platform doesn't implement name##Color, returning empty juce::Colour");\
  return juce::Colour();\
}

#define WRAPPED_VERSIONED_STANDARD_COLOR(name, version) juce::Colour StandardColours::name##Colour() {\
  if (@available(macOS version, *)) {\
    return ColourConverter::convert([COLOR_CLASS name##Color]);\
  } else {\
    DBG("Platform version doesn't support name, returning empty juce::Colour");\
    return juce::Colour();\
  }\
}

// Common Colors:

// Returns a color object for blue that automatically adapts to vibrancy and accessibility settings.
WRAPPED_STANDARD_COLOR(systemBlue)

// Returns a color object for green that automatically adapts to vibrancy and accessibility settings.
WRAPPED_STANDARD_COLOR(systemGreen)

// Returns a color object for orange that automatically adapts to vibrancy and accessibility settings.
WRAPPED_STANDARD_COLOR(systemOrange)

// Returns a color object for pink that automatically adapts to vibrancy and accessibility settings.
WRAPPED_STANDARD_COLOR(systemPink)

// Returns a color object for purple that automatically adapts to vibrancy and accessibility settings.
WRAPPED_STANDARD_COLOR(systemPurple)

// Returns a color object for red that automatically adapts to vibrancy and accessibility settings.
WRAPPED_STANDARD_COLOR(systemRed)

// Returns a color object for yellow that automatically adapts to vibrancy and accessibility settings.
WRAPPED_STANDARD_COLOR(systemYellow)

// Adaptable Gray Colors

// Returns a color object for gray that automatically adapts to vibrancy and accessibility settings.
WRAPPED_STANDARD_COLOR(systemGray)

// Transparent Color

// Returns a color object whose grayscale and alpha values are both 0.0.
WRAPPED_STANDARD_COLOR(clear)

// Fixed Colors

// Returns a color object whose grayscale value is 0.0 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(black)

// Returns a color object whose RGB value is 0.0, 0.0, 1.0 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(blue)

// Returns a color object whose RGB value is 0.6, 0.4, 0.2 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(brown)

// Returns a color object whose RGB value is 0.0, 1.0, 1.0 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(cyan)

// Returns a color object whose grayscale value is 1/3 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(darkGray)

// Returns a color object whose grayscale value is 0.5 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(gray)

// Returns a color object whose RGB value is 0.0, 1.0, 0.0 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(green)

// Returns a color object whose grayscale value is 2/3 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(lightGray)

// Returns a color object whose RGB value is 1.0, 0.0, 1.0 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(magenta)

// Returns a color object whose RGB value is 1.0, 0.5, 0.0 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(orange)

// Returns a color object whose RGB value is 0.5, 0.0, 0.5 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(purple)

// Returns a color object whose RGB value is 1.0, 0.0, 0.0 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(red)

// Returns a color object whose grayscale and alpha values are both 1.0.
WRAPPED_STANDARD_COLOR(white)

// Returns a color object whose RGB value is 1.0, 1.0, 0.0 and whose alpha value is 1.0.
WRAPPED_STANDARD_COLOR(yellow)

//// MacOS Colors
//
////Returns a color object for brown that automatically adapts to vibrancy and accessibility settings.
//WRAPPED_STANDARD_COLOR(systemBrown)
//
//
//////iOS Colors
//
//// An indigo color that automatically adapts to the current trait environment.
//WRAPPED_UNIMPLEMENTED_STANDARD_COLOR(systemIndigo)
//
//// A teal color that automatically adapts to the current trait environment.
//WRAPPED_UNIMPLEMENTED_STANDARD_COLOR(systemTeal)
//
//// Adaptable Gray Colors
//
//// A second-level shade of grey.
//WRAPPED_UNIMPLEMENTED_STANDARD_COLOR(systemGray2)
//
//// A third-level shade of grey.
//WRAPPED_UNIMPLEMENTED_STANDARD_COLOR(systemGray3)
//
//// A fourth-level shade of grey.
//WRAPPED_UNIMPLEMENTED_STANDARD_COLOR(systemGray4)
//
//// A fifth-level shade of grey.
//WRAPPED_UNIMPLEMENTED_STANDARD_COLOR(systemGray5)
//
//// A sixth-level shade of grey.
//WRAPPED_UNIMPLEMENTED_STANDARD_COLOR(systemGray6)
