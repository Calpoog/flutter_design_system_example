import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

import 'button.dart';

final buttonComponent = Component(
  name: 'Button',
  markdownString: 'This is the component markdown.',
  // Use some padding around the component in the canvas
  componentPadding: const EdgeInsets.all(20),
  // Use a decorator so the button isn't full width
  decorator: (context, child, globals) => IntrinsicWidth(
    child: child,
  ),
  builder: (BuildContext context, Arguments args, Globals globals) {
    return Button(
      text: args.value('text'),
      borderRadius: args.value('borderRadius'),
      color: args.value('color'),
      isDisabled: args.value('isDisabled'),
    );
  },
  argTypes: [
    ArgType<String>(
      name: 'text',
      description: 'The button text',
      isRequired: true,
    ),
    ArgType<bool>(
      name: 'isDisabled',
      description: 'Whether the show the button as disabled',
      defaultValue: false,
    ),
    ArgType<double>(
      name: 'borderRadius',
      description: 'The radius for all four rounded corners',
      defaultValue: 6.0,
    ),
    ArgType<Color>(
      name: 'color',
      description: 'The button background color',
      // For mappings with a default value, use defaultMapped instead of defaultValue
      // It must correspond to a key in mapping.
      defaultMapped: 'Blue',
      mapping: {
        'Red': Colors.red,
        'Blue': Colors.blue,
        'Green': Colors.green,
      },
      control: Controls.radio(),
    ),
    ArgType<VoidCallback?>(
      name: 'onPressed',
      description: 'A callback for when the user presses the button',
    ),
  ],
  stories: [
    Story(
      name: 'Default',
      markdownString: 'The default button.',
      args: {
        'text': 'Default',
      },
    ),
    Story(
      name: 'Primary',
      markdownString: 'A primary button for primary things.',
      args: const {
        'text': 'Primary',
        // When setting arg values for ArgTypes with a mapping, be sure to use
        // the mapping key.
        'color': 'Blue',
      },
    ),
    Story(
      name: 'Disabled',
      markdownString: 'Disabled button.',
      args: const {
        'text': 'Disabled',
      },
    ),
  ],
);
