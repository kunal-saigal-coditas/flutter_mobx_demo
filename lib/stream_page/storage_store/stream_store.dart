import 'dart:async';
import 'package:mobx/mobx.dart';

part 'stream_store.g.dart';

class StreamStore = _StreamStore with _$StreamStore;

abstract class _StreamStore with Store {
  // Internal stream subscription
  StreamSubscription<int>? _subscription;

  @observable
  int? value;

  @observable
  bool isLoading = false;

  @action
  void startListening() {
    isLoading = true;

    // Example stream: emits numbers every second
    final stream = Stream<int>.periodic(
      const Duration(seconds: 3),
      (count) => count + 1,
    ).take(20);

    _subscription = stream.listen((data) {
      value = data;
      isLoading = false;
    });
  }

  @action
  void stopListening() {
    _subscription?.cancel();
    _subscription = null;
  }

  void dispose() {
    stopListening();
  }
}
