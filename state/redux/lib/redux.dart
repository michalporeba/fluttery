enum Actions { ChangeSize }

class MyModel {
  final double size;

  const MyModel({required this.size});
}

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
MyModel myReducer(MyModel state, dynamic action) {
  if (action == Actions.ChangeSize) {
    return const MyModel(size: 0.5);
  }

  return state;
}