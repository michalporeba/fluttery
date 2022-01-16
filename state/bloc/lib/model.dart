import 'package:bloc/bloc.dart';

class SizeCubit extends Cubit<double> {
  SizeCubit() : super(0.5);

  void setSize(double value) => emit(value);
}