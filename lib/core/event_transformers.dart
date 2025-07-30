// ignore_for_file: void_checks

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

/// Throttle and droppable combined
///
/// Throttle is for cutting events
///
/// Droppable is for dropping the next events if current event is processing
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(
      events.throttle(
        (_) => TimerStream(true, duration),
      ),
      mapper,
    );
  };
}
