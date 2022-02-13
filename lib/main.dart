import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

void main() {
  runApp(const MyApp());
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    this.size = 40,
    required this.tooltipText,
  }) : super(key: key);

  final IconData icon;
  final Color backgroundColor;
  final double size;
  final String tooltipText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(size / 2),
        ),
      ),
      child: Tooltip(
        child: Icon(icon),
        message: tooltipText,
      ),
    );
  }
}

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

final Component textComponent = Component(
  name: 'Card',
  markdownFile: 'test.md',
  decorator: (context, child, globals) => Container(
    // width: double.infinity,
    // height: double.infinity,
    child: child,
  ),
  builder: (BuildContext context, Arguments arg, Globals globals) => const Card(
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Text('This is a card'),
    ),
  ),
  argTypes: [],
  stories: [
    Story(
      name: 'Card',
    ),
  ],
);

final buttonComponent = Component(
  name: 'Button',
  markdownString: 'This is the component markdown.',
  componentPadding: const EdgeInsets.all(20),
  decorator: (context, child, globals) => Container(
    alignment: Alignment.topLeft,
    child: child,
  ),
  builder: (BuildContext context, Arguments args, Globals globals) {
    return SizedBox(
      width: 200,
      child: TextButton(
        child: Text('${args.value('text')} ${args.value('number')}'),
        onPressed: (args.value('disabled') ?? false) ? null : () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(args.value('color')),
          shape: args.value('shape'),
          alignment: args.value('align'),
        ),
      ),
    );
  },
  argTypes: [
    ArgType<String>(
      name: 'text',
      description: 'The button text',
      defaultValue: 'Default',
    ),
    ArgType<double?>(
      name: 'number',
      description: 'A number',
    ),
    ArgType<AlignmentGeometry?>(
      name: 'align',
      description: 'The alignment of the text inside the button',
      mapping: {
        'Left': Alignment.centerLeft,
        'Right': Alignment.centerRight,
        'Center': Alignment.center,
      },
    ),
    ArgType<MaterialStateProperty<OutlinedBorder>>(
      name: 'shape',
      description: 'The button shape',
      // isRequired: true,
      defaultMapped: 'Stadium',
      mapping: {
        'Stadium': MaterialStateProperty.all(const StadiumBorder()),
        'Rounded long lnas asslakdf jas asdkfa  niureiq q nqn wefqwe':
            MaterialStateProperty.all(const RoundedRectangleBorder()),
      },
      control: Controls.radio(),
    ),
    ArgType<bool?>(
      name: 'disabled',
      description: 'A toggle',
    ),
    ArgType<Color>(
      name: 'color',
      description: 'The button color',
      defaultValue: Colors.grey,
      // isRequired: true,
    ),
  ],
  stories: [
    Story(
      name: 'Default',
      markdownString: 'The default button.',
      // args: baseArgs,
    ),
    Story(
      name: 'Primary',
      markdownString: 'A primary button for primary things.',
      args: const {
        'text': 'Primary',
        'color': Colors.blue,
      },
    ),
    Story(
      name: 'Secondary',
      markdownString: 'A secondary button for secondary things.',
      args: const {
        'text': 'Secondary',
        'color': Colors.green,
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesignSystem(
      config: DesignSystemConfig(
          // decorator: (context, child, globals) => MaterialApp(
          //   theme: context.read<DesignSystemConfig>().themes[globals['theme']],
          //   debugShowCheckedModeBanner: false,
          //   // Use builder here so there's no sub navigator interfering with routing
          //   builder: (_, __) => Scaffold(body: child),
          // ),
          ),
      explorer: [
        circleIconComponent,
        Root(name: 'Library', children: [
          Documentation(
            name: 'Introduction',
            markdownFile: 'test.md',
          ),
          Folder(
            name: 'Widgets',
            children: [
              buttonComponent,
              textComponent,
            ],
          )
        ]),
      ],
    );
  }
}
