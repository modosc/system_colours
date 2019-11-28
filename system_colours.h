/*
  ==============================================================================
  ==============================================================================
*/


/*******************************************************************************
 The block below describes the properties of this module, and is read by
 the Projucer to automatically generate project code that uses it.
 For details about the syntax and how to create or use a module, see the
 JUCE Module Format.txt file.
 BEGIN_JUCE_MODULE_DECLARATION
  ID:               system_colours
  vendor:           modosc
  version:          0.2.0
  name:             System Colours
  description:      A module that gives access to native system colours (and colors)
  website:          https://github.com/modosc/system_colours
  license:          MIT
  dependencies:     juce_core, juce_gui_basics, juce_graphics
 END_JUCE_MODULE_DECLARATION
*******************************************************************************/


#pragma once
#define SYSTEM_COLOURS_H_INCLUDED

#include <juce_core/juce_core.h>
#include <juce_gui_basics/juce_gui_basics.h>
#include <juce_graphics/juce_graphics.h>

#include "colour_converter/colour_converter.h"
#include "standard_colours/standard_colours.h"
#include "ui_element_colours/ui_element_colours.h"

