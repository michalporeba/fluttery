import 'package:flutter/material.dart';
import 'defaults.dart';

// the part of the display that shows previous operations
class History extends StatelessWidget {
  // because it is a UI demo only, the data is hardcoded
  // in the widget, for the purpose of display testing
  final List<String> elements = const <String>[
    '= 42.00', '- 114.89', '= 156.89', '+ 123.45', '33.44'
  ];

  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
    => Expanded(
      child: Padding(
        padding: const EdgeInsets.all(padding),
        // dynamic list, as every new operation may be added to the history
        child: ListView.builder(
            reverse: true,
            itemCount: elements.length,
            itemBuilder: (context, index) {
              return Row( // used to right align in left-to-right orientation
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HistoryItem(value: elements[index])
                  ]
              );
            }
        ),
      ),
    );
  }

// used to consistently style each individual history item
class HistoryItem extends StatelessWidget {
  final String value;

  const HistoryItem({
    required this.value,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding/2),
      child: Text(value, style: Theme.of(context).textTheme.headline4),
    );
  }
}