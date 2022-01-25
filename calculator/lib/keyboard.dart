import 'package:flutter/material.dart';
import 'defaults.dart';


class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = 1.3;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      Rect bounds = context.findRenderObject()?.paintBounds ?? Rect.zero;
      ratio = bounds.width / (bounds.height - padding*6);
    }

    return SizedBox(
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(padding),
          crossAxisCount: 4,
          crossAxisSpacing: padding/2,
          mainAxisSpacing: padding/2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: ratio > 0 ? ratio : 1.3,
          children: [
            const OperationButton(label: Icons.help_outline, highlight: true,),
            OperationButton(label: 'x'+String.fromCharCode(0x207f)),
            OperationButton(label: String.fromCharCode(0x221A)),
            const OperationButton(label: Icons.backspace, highlight: true,),

            const NumberButton(label: '7'),
            const NumberButton(label: '8'),
            const NumberButton(label: '9'),
            OperationButton(label: String.fromCharCode(0x00f7)),

            const NumberButton(label: '4'),
            const NumberButton(label: '5'),
            const NumberButton(label: '6'),
            const OperationButton(label: Icons.clear),

            const NumberButton(label: '1'),
            const NumberButton(label: '2'),
            const NumberButton(label: '3'),
            const OperationButton(label: Icons.add),

            const NumberButton(label: '0'),
            const NumberButton(label: '.'),
            const OperationButton(label: '='),
            const OperationButton(label: Icons.remove)
          ]
      ),
    );
  }
}


class NumberButton extends StatelessWidget {
  final String label;

  const NumberButton({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => true,
        child: Text(label, style: const TextStyle(color: Colors.black54, fontSize: 48))
    );
  }
}

class OperationButton extends StatelessWidget {
  final Object label;
  final bool highlight;

  const OperationButton({
    required this.label,
    this.highlight = false,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = highlight
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).textTheme.bodyText1?.color ?? Colors.black54;

    return ElevatedButton(
        onPressed: null,
        child: _createLabel(label, color)
    );
  }

  // label can be an icon or a text, so it has to be generated dynamically
  Widget _createLabel(Object label, Color color) {
    // I am not using the styles here to have more flexibility
    // to use the accent colours on buttons to show different type of action
    if (label is IconData) {
      return Icon(label, size: 40, color: color);
    } else if (label is String) {
      return Text(label, style: TextStyle(color: color, fontSize: 40));
    } else {
      return Container(); // not supported type
    }
  }
}