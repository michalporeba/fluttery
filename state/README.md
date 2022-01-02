# State experiments

Inspired by the [Pragmatic State management in Flutter]() talk from Google I/O 2019, I have attempted to implement the same basic app demonstrating sate management, using different approaches. 

The outcome is always the same, but the mechanics, and the code are different. I have tried: 

* [Base Project](#base-project)
* [Naive Approach](#naive-approach)
* [Inherited Widget](#inherited-widget)

| Base | Naive | Inherited |
| --- | --- | --- |
| ![](./images/base.png) | ![](./images/naive.png) | ![](./images/inherited.png) |

# Implementations

&nbsp;
## Base Project
The [code] in the base project implements the layout and behaviour of the slider. 
The pie chart does not react to it as there is no state management outside of the slider widget. 

There are three important files in the solution. `main.dart` is the starting point which controls the layout. `char.dart` implements `MyChar`, a pie chart using `charts_flutter` [package](https://pub.dev/packages/charts_flutter) from Google. `slider.dart` implements the `MySlider` widget responsible for the slider at the bottom of the page. 

`main.dart` depends on both `chart.dart` and `slider.dart` but the latter two don't depend on each other.

&nbsp;
## Naive Approach

Following the anti-example from the talk, in this naive approach to state management I store
the chart's state in a global variable. 

```dart
_MyChartState chartState = _MyChartState();

class MyChart extends StatefulWidget {
  @override
  State<MyChart> createState() => chartState;
  
  /* the rest */
}
```

The `_MyChartState class exposes a method to manipulate the value externally:

```dart
void setValue(double value) {
    setState(() { _value = value; });
}
```

And the slider, from its state change handler can change chart's state.

```dart
void _valueChanged(double value) {
    setState(() { _value = value; });
    chartState.setValue(value);
}
```


&nbsp;
## Inherited Widget

Another approach, is to hoist the model to a place in the element tree that is common to all of the elements. 

Classes like [Inherited Widget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html) and [Inherited Notifier](https://api.flutter.dev/flutter/widgets/InheritedNotifier-class.html) help to implement this pattern as seen in the [sample code](./inherited).

The main advantage is, that the widgets below in the tree can be stateless.

But this comes with an addition of two new classes defined in `model.dart`:

```dart
class HomeModel extends InheritedNotifier<HomeState> {
  HomeModel({
    Key? key,
    required HomeState notifier,
    required child
  }) : super(key: key, notifier: notifier, child: child);

  HomeState state = HomeState();

  @override
  bool updateShouldNotify(covariant HomeModel oldWidget)
  => state.size != oldWidget.state.size;

  static HomeState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeModel>()?.notifier
      ?? HomeState();
  }
}

class HomeState extends ChangeNotifier {
  double _size = 0.0;
  HomeState();

  double get size => _size;
  set size(double value) {
    _size = value;
    notifyListeners();
  }
}
```