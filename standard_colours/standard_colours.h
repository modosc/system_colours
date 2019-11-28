#pragma once

class StandardColours
{
public:
  // Returns a color object for blue that automatically adapts to vibrancy and accessibility settings.
  static juce::Colour systemBlueColour();

  // Returns a color object for green that automatically adapts to vibrancy and accessibility settings.
  static juce::Colour systemGreenColour();

  // Returns a color object for orange that automatically adapts to vibrancy and accessibility settings.
  static juce::Colour systemOrangeColour();

  // Returns a color object for pink that automatically adapts to vibrancy and accessibility settings.
  static juce::Colour systemPinkColour();

  // Returns a color object for purple that automatically adapts to vibrancy and accessibility settings.
  static juce::Colour systemPurpleColour();

  // Returns a color object for red that automatically adapts to vibrancy and accessibility settings.
  static juce::Colour systemRedColour();

  // Returns a color object for yellow that automatically adapts to vibrancy and accessibility settings.
  static juce::Colour systemYellowColour();

  // Adaptable Gray Colors

  // Returns a color object for gray that automatically adapts to vibrancy and accessibility settings.
  static juce::Colour systemGrayColour();

  // Transparent Color

  // Returns a color object whose grayscale and alpha values are both 0.0.
  static juce::Colour clearColour();

  // Fixed Colors

  // Returns a color object whose grayscale value is 0.0 and whose alpha value is 1.0.
  static juce::Colour blackColour();

  // Returns a color object whose RGB value is 0.0, 0.0, 1.0 and whose alpha value is 1.0.
  static juce::Colour blueColour();

  // Returns a color object whose RGB value is 0.6, 0.4, 0.2 and whose alpha value is 1.0.
  static juce::Colour brownColour();

  // Returns a color object whose RGB value is 0.0, 1.0, 1.0 and whose alpha value is 1.0.
  static juce::Colour cyanColour();

  // Returns a color object whose grayscale value is 1/3 and whose alpha value is 1.0.
  static juce::Colour darkGrayColour();

  // Returns a color object whose grayscale value is 0.5 and whose alpha value is 1.0.
  static juce::Colour grayColour();

  // Returns a color object whose RGB value is 0.0, 1.0, 0.0 and whose alpha value is 1.0.
  static juce::Colour greenColour();

  // Returns a color object whose grayscale value is 2/3 and whose alpha value is 1.0.
  static juce::Colour lightGrayColour();

  // Returns a color object whose RGB value is 1.0, 0.0, 1.0 and whose alpha value is 1.0.
  static juce::Colour magentaColour();

  // Returns a color object whose RGB value is 1.0, 0.5, 0.0 and whose alpha value is 1.0.
  static juce::Colour orangeColour();

  // Returns a color object whose RGB value is 0.5, 0.0, 0.5 and whose alpha value is 1.0.
  static juce::Colour purpleColour();

  // Returns a color object whose RGB value is 1.0, 0.0, 0.0 and whose alpha value is 1.0.
  static juce::Colour redColour();

  // Returns a color object whose grayscale and alpha values are both 1.0.
  static juce::Colour whiteColour();

  // Returns a color object whose RGB value is 1.0, 1.0, 0.0 and whose alpha value is 1.0.
  static juce::Colour yellowColour();
};
