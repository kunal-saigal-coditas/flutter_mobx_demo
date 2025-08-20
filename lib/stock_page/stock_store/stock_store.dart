import 'dart:async';
import 'dart:math';
import 'package:mobx/mobx.dart';

part 'stock_store.g.dart';

class Stock = _Stock with _$Stock;

abstract class _Stock with Store {
  final String symbol;

  _Stock(this.symbol, this.currentPrice);

  @observable
  double currentPrice;

  @observable
  double? previousPrice;
}

class StockStore = _StockStore with _$StockStore;

abstract class _StockStore with Store {
  final List<String> stockSymbols = ["Apple", "Google", "Amazon", "Tesla"];
  final Random _random = Random();
  StreamSubscription? _subscription;

  @observable
  ObservableList<Stock> stocks = ObservableList<Stock>();

  @observable
  bool isStreaming = false;

  _StockStore() {
    // initialize with default prices
    stocks.addAll(
      stockSymbols.map((s) => Stock(s, 100 + _random.nextInt(50).toDouble())),
    );
  }

  /// Start stock updates
  @action
  void startStreaming() {
    if (isStreaming) return;
    isStreaming = true;

    final stream = Stream.periodic(const Duration(milliseconds: 1500), (_) {
      for (var stock in stocks) {
        stock.previousPrice = stock.currentPrice;
        final change = (_random.nextDouble() * 6) - 3;

        stock.currentPrice = double.parse(
          (stock.currentPrice + change).toStringAsFixed(2),
        );
      }
      return stocks;
    });

    _subscription = stream.listen((_) {});
  }

  @action
  void addManyStocks() {
    for (var i = 0; i < 500; i++) {
      stocks.add(Stock("STOCK_$i", 100 + _random.nextDouble() * 900));
    }
  }

  /// Stop updates
  @action
  void stopStreaming() {
    _subscription?.cancel();
    _subscription = null;
    isStreaming = false;
  }

  void dispose() {
    stopStreaming();
  }
}
