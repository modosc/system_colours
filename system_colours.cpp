
#include "AppConfig.h"

#if JUCE_MAC || JUCE_IOS
  #include <CoreFoundation/CoreFoundation.h>
  #import <Foundation/Foundation.h>
#endif

#include "system_colours.h"

#if JUCE_MAC
  #include "ui_element_colours/ui_element_colours_OSX.mm"
#elif JUCE_IOS
  #include "ui_element_colours/ui_element_colours_iOS.mm"
#endif

