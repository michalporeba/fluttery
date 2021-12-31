import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(
        child: Settings()
      )
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: <Widget>[
          Text('Work', style: textStyle), Spacer(), Spacer(),
          SettingsButton(color: Colors.blueGrey, text: '-', value: -1),
          SettingsTextField(),
          SettingsButton(color: Colors.blueGrey, text: '+', value: 1),
          Text('Short', style: textStyle), Spacer(), Spacer(),
          SettingsButton(color: Colors.blueGrey, text: '-', value: -1),
          SettingsTextField(),
          SettingsButton(color: Colors.blueGrey, text: '+', value: 1),
          Text('Long', style: textStyle), Spacer(), Spacer(),
          SettingsButton(color: Colors.blueGrey, text: '-', value: -1),
          SettingsTextField(),
          SettingsButton(color: Colors.blueGrey, text: '+', value: 1),
        ],
        padding: const EdgeInsets.all(20.0)
      )
    );
  }
}

class SettingsButton extends StatelessWidget {
  final Color color;
  final String text;
  final int value;

  SettingsButton({
    required this.color,
    required this.text,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        this.text,
        style: const TextStyle(color: Colors.white)
      ),
      color: this.color,
      onPressed: () => null
    );
  }
}

class SettingsTextField extends TextField {
  SettingsTextField() : super(
    style: textStyle,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number
  );
}

TextStyle textStyle = TextStyle(fontSize: 24);