import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

final textComponent = Component(
  name: 'Text',
  componentPadding: const EdgeInsets.all(20.0),
  builder: (BuildContext context, Arguments arg, Globals globals) => const Text('This is some text'),
  stories: [
    // This story will be shown without a Component parent in the explorer.
    // Components with a single Story with the same name as the Component will behave this way.
    Story(
      name: 'Text',
    ),
  ],
);
