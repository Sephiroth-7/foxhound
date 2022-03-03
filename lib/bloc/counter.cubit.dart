// ignore: import_of_legacy_library_into_null_safe
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(int initialState) : super(initialState);

  void increment() {
    emit(state + 15);
  }

  void decrement() {
    emit(state - 1);
  }
}
