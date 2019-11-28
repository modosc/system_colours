#pragma once
class UIElementColours
{
public:
  static juce::LookAndFeel_V4::ColourScheme getSystemColourScheme();

  // Common Colors:

  // Label Colors

  // The color for text labels that contain primary content.
  static juce::Colour labelColour();

  // The color for text labels that contain secondary content.
  static juce::Colour secondaryLabelColour();
  // The color for text labels that contain tertiary content.
  static juce::Colour tertiaryLabelColour();
  // The color for text labels that contain quaternary content..
  static juce::Colour quaternaryLabelColour();

  // Text Colors

  // The color to use for placeholder text in controls or text views.
  static juce::Colour placeholderTextColour();

  // Link Color

  // The color to use for links.
  static juce::Colour linkColour();

  // Separator Colors

  // The color to use for separators between different sections of content.
  static juce::Colour separatorColour();


  // iOS colors

  // An overlay fill color for thin and small shapes.
  static juce::Colour systemFillColour();
  // An overlay fill color for medium-size shapes
  static juce::Colour secondarySystemFillColour();
  // An overlay fill color for large shapes.
  static juce::Colour tertiarySystemFillColour();
  // An overlay fill color for large areas that contain complex content.
  static juce::Colour quaternarySystemFillColour();

  // Standard Content Background Colors

  // The color for the main background of your interface.
  static juce::Colour systemBackgroundColour();
  // The color for content layered on top of the main background.
  static juce::Colour secondarySystemBackgroundColour();
  // The color for content layered on top of secondary backgrounds.
  static juce::Colour tertiarySystemBackgroundColour();

  // Grouped Content Background Colors

  // The color for the main background of your grouped interface.
  static juce::Colour systemGroupedBackgroundColour();
  // The color for content layered on top of the main background of your grouped interface.
  static juce::Colour secondarySystemGroupedBackgroundColour();
  // The color for content layered on top of secondary backgrounds of your grouped interface.
  static juce::Colour tertiarySystemGroupedBackgroundColour();

  // Separator Colors

  // The color for borders or divider lines that hides any underlying content.
  static juce::Colour opaqueSeparatorColour();

  // Nonadaptable Colors

  // The nonadaptable system color for text on a light background.
  static juce::Colour darkTextColour();
  // The nonadaptable system color for text on a dark background.
  static juce::Colour lightTextColour();


  // MacOS Colors

  // Text Colors

  // The color to use for text.
  static juce::Colour textColour();
  // The color to use for selected text.
  static juce::Colour selectedTextColour();
  // The color to use for the background area behind text.
  static juce::Colour textBackgroundColour();
  // The color to use for the background of selected text.
  static juce::Colour selectedTextBackgroundColour();
  // The color to use for the keyboard focus ring around controls.
  static juce::Colour keyboardFocusIndicatorColour();
  // The color to use for selected text in an unemphasized context.
  static juce::Colour unemphasizedSelectedTextColour();
  // The color to use for the text background in an unemphasized context.
  static juce::Colour unemphasizedSelectedTextBackgroundColour();

  // Content Colors

  // The color to use for the background of selected and emphasized content.
  static juce::Colour selectedContentBackgroundColour();
  // The color to use for selected and unemphasized content.
  static juce::Colour unemphasizedSelectedContentBackgroundColour();

  // Menu Colors

  // The color to use for the text in menu items.
  static juce::Colour selectedMenuItemTextColour();

  // Table Colors

  // The color to use for the optional gridlines, such as those in a table view.
  static juce::Colour gridColour();
  // The color to use for text in header cells in table views and outline views.
  static juce::Colour headerTextColour();

  // TODO - how to implement this?
  // static juce::Colour alternatingContentBackgroundColorsColour();;
  // The colors to use for alternating content, typically found in table views and collection views.

  // Control Colors

  // The user's current accent color preference.
  static juce::Colour controlAccentColour();
  // The color to use for the flat surfaces of a control.
  static juce::Colour controlColour();
  // The color to use for the background of large controls, such as scroll views or table views.
  static juce::Colour controlBackgroundColour();
  // The color to use for text on enabled controls.
  static juce::Colour controlTextColour();
  // The color to use for text on disabled controls.
  static juce::Colour disabledControlTextColour();
  // The current system control tint color.
  // static juce::Colour currentControlTintColour();
  // The color to use for the face of a selected control—that is, a control that has been clicked or is being dragged.
  static juce::Colour selectedControlColour();
  // The color to use for text in a selected control—that is, a control being clicked or dragged.
  static juce::Colour selectedControlTextColour();
  // The color to use for text in a selected control.
  static juce::Colour alternateSelectedControlTextColour();
  // The patterned color to use for the background of a scrubber control.
  static juce::Colour scrubberTexturedBackgroundColour();

  // Window Colors

  // The color to use for the window background.
  static juce::Colour windowBackgroundColour();
  // The color to use for text in a window's frame.
  static juce::Colour windowFrameTextColour();
  // The color to use in the area beneath your window's views.
  static juce::Colour underPageBackgroundColour();

  // Highlights and Shadows

  // The highlight color to use for the bubble that shows inline search result values.
  static juce::Colour findHighlightColour();
  // The color to use as a virtual light source on the screen.
  static juce::Colour highlightColour();
  // The color to use for virtual shadows cast by raised objects on the screen.
  static juce::Colour shadowColour();
};


