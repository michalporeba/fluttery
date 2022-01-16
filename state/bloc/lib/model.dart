import 'package:bloc/bloc.dart';

class Model {
  final double size;
  const Model({required this.size});
  Model copyWith({double? size}) {
    return Model(
      size: size ?? this.size
    );
  }
}

class ModelCubit extends Cubit<Model> {
  ModelCubit() : super(const Model(size: 0.5));

  void setSize(double value) => emit(state.copyWith(size: value));
}