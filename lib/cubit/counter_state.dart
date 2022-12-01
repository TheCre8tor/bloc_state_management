import 'package:flutter/foundation.dart' show immutable;

@immutable
class CounterState {
  final int count;

  const CounterState(this.count);

  CounterState copyWith({int? count}) {
    return CounterState(count ?? this.count);
  }
}
