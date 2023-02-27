import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

import 'circle_icon.dart';

final circleIconComponent = Component(
  name: 'CircleIcon',
  markdownString: 'An icon displayed in a colored circle.',
  builder: (BuildContext context, Arguments args, Globals globals) {
    return CircleIcon(
      icon: args.value('icon'),
      backgroundColor: args.value('backgroundColor'),
      size: args.value('size'),
      tooltipText: args.value('tooltipText'),
    );
  },
  argTypes: [
    ArgType<IconData>(
      name: 'icon',
      description: 'The icon to display',
      isRequired: true,
    ),
    ArgType<Color>(
      name: 'backgroundColor',
      description: 'The color of the circle behind the icon',
      isRequired: true,
    ),
    ArgType<double>(
      name: 'size',
      description: 'The diameter of the circle',
      defaultValue: 40,
    ),
    ArgType<String>(
      name: 'tooltipText',
      description: 'The text to display in a tooltip when the cirlce is hovered',
      isRequired: true,
    ),
  ],
  stories: [
    Story(
      name: 'Basic',
      args: {
        'icon': Icons.message,
        'backgroundColor': Colors.amber,
        'tooltipText': 'Message',
      },
    ),
    Story(
      name: 'Error',
      markdownString: 'Used to indicate in error in our app.',
      useControls: false,
      args: {
        'icon': Icons.warning,
        'backgroundColor': Colors.red,
        'tooltipText': 'Message',
      },
    ),
  ],
);
