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

class ColourConverter
{
public:
  static juce::Colour convert(COLOR_CLASS *);
};
