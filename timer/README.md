# Timer

It is the example from the third chapter in Packt's [Flutter Projects](https://www.packtpub.com/product/flutter-projects/9781838647773) book, first edition from April 2020. It is vaguely based on the concepts from Cal Newport's book Deep Work.

&nbsp; 
## Things learnt

* Custom widgets
* [Layout Builder](https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html) - allows for a more dynamic layout choices. 
* [Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html), [StreamBuilder](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html) and [asynchronous programming](https://dart.dev/tutorials/language/streams) in Flutter
* [Navigation](https://docs.flutter.dev/development/ui/navigation), settings and menus ([MenuButton](https://api.flutter.dev/flutter/material/PopupMenuButton-class.html))
* [GridView](https://api.flutter.dev/flutter/widgets/GridView-class.html) Layout

```
Stream<TimerModel> stream() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int a) {
        return TimerModel(...);
    }
}
```