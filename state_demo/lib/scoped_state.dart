import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'defaults.dart';


class TheState extends Model {
  double _width = 0.5;
  double _height = 0.5;
  Color _color = Colors.blue;

  double get width => _width;
  double get height => _height;
  Color get color => _color;

  set width(double value) {
    _width = value;
    notifyListeners();
  }

  set height(double value) {
    _height = value;
    notifyListeners();
  }

  set color(Color value) {
    _color = value;
    notifyListeners();
  }
}


class SampleStateApp extends StatelessWidget {
  final Widget home;
  const SampleStateApp({required this.home, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<TheState>(
        model: TheState(),
        child: home
    );
  }
}


class ColorButton extends StatelessWidget {
  final Color color;
  final String label;

  const ColorButton({
    required this.color,
    required this.label,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TheState>(
        builder: (context, child, state) {
          return OutlinedButton(
              onPressed: () => state.color = color,
              child: Text(label, style: buttonStyle(color))
          );
        }
    );
  }
}


class MySlider extends StatelessWidget {
  final String attribute;
  const MySlider({required this.attribute, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TheState>(
      builder: (context, child, model) {
        return Slider(
            value: attribute == 'width' ? model.width : model.height,
            onChanged: (value) {
              if (attribute == 'width') {
                model.width = value;
              } else {
                model.height = value;
              }
            }
        );
      }
    );
  }
}


class TheSquare extends StatelessWidget {
  const TheSquare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TheState>(
        builder: (context, _, model) {
          return SizedBox(
              width: 50 + model.width * 200,
              height: 50 + model.height * 200,
              child: DecoratedBox(decoration: BoxDecoration(color: model.color))
          );
        }
    );
  }
}