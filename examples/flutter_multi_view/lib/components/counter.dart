import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import 'embedded_counter.dart';

class Counter extends StatefulComponent {
  const Counter({required this.name, super.key});

  final String name;

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  int count = 0;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'counter-group', styles: Styles(raw: {'view-transition-name': component.name}), [
      div(classes: 'counter', [
        button(
          onClick: () {
            setState(() => count--);
          },
          [text('–')],
        ),
        span([
          text('Jaspr Counter'),
          br(),
          b([text('$count')]),
        ]),
        button(
          onClick: () {
            setState(() => count++);
          },
          [text('+')],
        ),
      ]),
      EmbeddedCounter(
        count: count,
        onChange: (value) {
          setState(() => count = value);
        },
      ),
    ]);
  }

  @css
  static final styles = [
    css('.counter-group').styles(
      margin: Margin.all(10.px),
      padding: Padding.all(10.px),
      border: Border(style: BorderStyle.dashed, width: 1.px, color: Colors.lightGrey),
      radius: BorderRadius.circular((cardBorderRadius + 10).px),
    ),
    css('.counter', [
      css('&').styles(
        padding: Padding.symmetric(vertical: 10.px),
        border: Border(color: primaryColor, width: 1.px),
        radius: BorderRadius.circular(cardBorderRadius.px),
        maxWidth: cardWidth.px,
        minHeight: cardHeight.px,
        boxSizing: BoxSizing.borderBox,
        backgroundColor: surfaceColor,
        display: Display.flex,
        alignItems: AlignItems.center,
        justifyContent: JustifyContent.spaceAround,
        color: Colors.black,
      ),
      css('button', [
        css('&').styles(
          fontSize: 1.5.rem,
          width: 2.em,
          height: 2.em,
          border: Border.unset,
          cursor: Cursor.pointer,
          radius: BorderRadius.all(Radius.circular(2.em)),
          display: Display.flex,
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
          backgroundColor: Colors.transparent,
        ),
        css('&:hover').styles(
          backgroundColor: const Color.hex('#0001'),
        ),
      ]),
      css('span').styles(
        fontSize: 14.px,
        textAlign: TextAlign.center,
      ),
      css('b').styles(fontSize: 18.px),
    ]),
  ];
}
