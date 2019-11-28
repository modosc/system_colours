
#include "AppConfig.h"

#if JUCE_MAC || JUCE_IOS
  #include <CoreFoundation/CoreFoundation.h>
  #import <Foundation/Foundation.h>
#endif

#include "system_colours.h"

#if JUCE_MAC
  #include "colour_converter/colour_converter_OSX.mm"
  #include "standard_colours/standard_colours_OSX.mm"
  #include "ui_element_colours/ui_element_colours_OSX.mm"
#elif JUCE_IOS
  #include "colour_converter/colour_converter_iOS.mm"
  #include "standard_colours/standard_colours_iOS.mm"
  #include "ui_element_colours/ui_element_colours_iOS.mm"
#endif

