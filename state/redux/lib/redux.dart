class MyState {
  final double size;
  const MyState({required this.size});

  MyState copyWith({double? size}) {
    return MyState(
      size: size ?? this.size
    );
  }
}

class SetSizeAction {
  final double size;
  const SetSizeAction(this.size);
  MyState modify(MyState state) {
    return state.copyWith(size: size);
  }
}

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
MyState myReducer(MyState state, dynamic action) {
  return state = action.modify(state);
}