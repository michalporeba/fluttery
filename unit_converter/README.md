# Unit Converter

It is the example from the second chapter in Packt's [Flutter Projects](https://www.packtpub.com/product/flutter-projects/9781838647773) book, first edition from April 2020. 

&nbsp;
## Things learnt

* Stateless widget overrides the `build(...)` method. Stateful overrides `createState()` which returns state, which overrides the `build(...)` method returning the Widget. 
* [Spacer](https://api.flutter.dev/flutter/widgets/Spacer-class.html) to customise spacing of children in [Column](https://api.flutter.dev/flutter/widgets/Column-class.html) or [Row](https://api.flutter.dev/flutter/widgets/Row-class.html) by adjusting its `flex` property.
* [Container](https://api.flutter.dev/flutter/widgets/Container-class.html) used to conviniently apply background, margin and padding to any Widget. 

&nbsp;
## Warnings
* [There are problems](https://github.com/flutter/flutter/issues/18711) with `SingleChildScrolView` when wrapping `Spacer` widgets. (Solution for this simple app - don't do it even if it means the app won't work in landscape orientation).

&nbsp;
## Outcomes