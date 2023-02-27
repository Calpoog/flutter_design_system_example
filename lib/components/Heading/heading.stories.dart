import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

// Define the stories outside of their component so we can reference them and
// take advantage of story reuse to create one story that shows all of them.
final headingStories = [
  Story(
    name: 'H1',
    // The Heading component has no ArgTypes, so no args are provided.
    // Each story has its own unique builder instead of using one defined in the component
    builder: (BuildContext context, Arguments arg, Globals globals) =>
        Text('Heading 1', style: Theme.of(context).textTheme.headline1),
  ),
  Story(
    name: 'H2',
    builder: (BuildContext context, Arguments arg, Globals globals) =>
        Text('Heading 2', style: Theme.of(context).textTheme.headline2),
  ),
  Story(
    name: 'H3',
    builder: (BuildContext context, Arguments arg, Globals globals) =>
        Text('Heading 3', style: Theme.of(context).textTheme.headline3),
  ),
  Story(
    name: 'H4',
    builder: (BuildContext context, Arguments arg, Globals globals) =>
        Text('Heading 4', style: Theme.of(context).textTheme.headline4),
  ),
  Story(
    name: 'H5',
    builder: (BuildContext context, Arguments arg, Globals globals) =>
        Text('Heading 5', style: Theme.of(context).textTheme.headline5),
  ),
  Story(
    name: 'H6',
    builder: (BuildContext context, Arguments arg, Globals globals) =>
        Text('Heading 6', style: Theme.of(context).textTheme.headline6),
  ),
];

final headingsAllStory = Story(
  name: 'All',
  builder: (BuildContext context, Arguments arg, Globals globals) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // We can use SubStory to render other stories from the design system.
      children: headingStories.map((story) => SubStory(story: story)).toList()),
);

final Component headingComponent = Component(
  name: 'Heading',
  componentPadding: const EdgeInsets.all(20.0),
  // Let's control this component's Docs tab manually, since the auto-generated
  // DocsPage is a little overkill.
  useDocsPage: false,
  // Use a doc widget instead of Markdown, as an example
  docWidget: ReadingWidth(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const H1('Headings'),
        const Paragraph(
            text:
                'Headings should be used to create hierarchy. A page should only have a single H1. H2-H6 can be used as much as necessary.'),
        DocCanvas(
          story: headingsAllStory,
        ),
      ],
    ),
  ),
  // Each story has it's own builder to show something unique, so no component
  // builder is necessary.
  stories: [
    headingsAllStory,
    ...headingStories,
  ],
);
