import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

import 'components/Button/button.stories.dart';
import 'components/CircleIcon/circle_icon.stories.dart';
import 'components/Heading/heading.stories.dart';
import 'components/Text/text.stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesignSystem(
      explorer: [
        Documentation(
          name: 'Introduction',
          markdownFile: 'test.md',
        ),
        circleIconComponent,
        Root(name: 'Library', children: [
          Folder(
            name: 'Widgets',
            children: [
              buttonComponent,
              headingComponent,
              textComponent,
            ],
          )
        ]),
      ],
    );
  }
}
