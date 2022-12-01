import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/cubit/counter_state.dart';
import 'package:flutter/foundation.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(0));

  void increment() => emit(state.copyWith(count: state.count + 1));

  void decrement() => emit(state.copyWith(count: state.count - 1));

  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }
}
