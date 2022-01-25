import 'package:flutter/material.dart';
import 'defaults.dart';

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(padding/2)),
              border: Border.all(
                  // this is a one off, custom display widget so defining the look
                  // here makes sense, however it should still link back to the theme
                  // as much as practical
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                  style: BorderStyle.solid
              )
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(padding),
                  // display text is hardcoded for the purpose of the ui demo
                  child: Text('123,456.78',
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.headline2
                  ),
                ) ]
          )
      ),
    );
  }
}