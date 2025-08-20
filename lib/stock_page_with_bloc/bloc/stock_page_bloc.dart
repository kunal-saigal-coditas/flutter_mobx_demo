import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx_demo/stock_page_with_bloc/model/stock_model.dart';

part 'stock_page_event.dart';
part 'stock_page_state.dart';

// BLOC
class StockBloc extends Bloc<StockEvent, StockState> {
  final Random _random = Random();
  StreamSubscription? _subscription;

  StockBloc()
    : super(
        StockState(
          stocks: [
            StockModel(symbol: "AAPL", currentPrice: 120),
            StockModel(symbol: "GOOG", currentPrice: 150),
            StockModel(symbol: "AMZN", currentPrice: 180),
            StockModel(symbol: "TSLA", currentPrice: 200),
          ],
          isStreaming: false,
        ),
      ) {
    on<StartStockStream>(_onStart);
    on<StopStockStream>(_onStop);
    on<UpdateStockPrices>(_onUpdate);
    on<AddManyStocks>(_onAddManyStocks);
  }

  void _onStart(StartStockStream event, Emitter<StockState> emit) {
    if (state.isStreaming) return;
    emit(state.copyWith(isStreaming: true));

    _subscription = Stream.periodic(const Duration(seconds: 1)).listen((_) {
      add(UpdateStockPrices());
    });
  }

  void _onStop(StopStockStream event, Emitter<StockState> emit) {
    _subscription?.cancel();
    _subscription = null;
    emit(state.copyWith(isStreaming: false));
  }

  void _onUpdate(UpdateStockPrices event, Emitter<StockState> emit) {
    final updatedStocks = state.stocks.map((stock) {
      final change = (_random.nextDouble() * 6) - 3; // -3 to +3
      final newPrice = double.parse(
        (stock.currentPrice + change).toStringAsFixed(2),
      );
      return stock.copyWith(
        previousPrice: stock.currentPrice,
        currentPrice: newPrice,
      );
    }).toList();

    emit(state.copyWith(stocks: updatedStocks));
  }

  void _onAddManyStocks(AddManyStocks event, Emitter<StockState> emit) {
    final newStocks = List.generate(
      500,
      (i) => StockModel(
        symbol: "STOCK_$i",
        currentPrice: 100 + _random.nextDouble() * 900,
      ),
    );
    emit(state.copyWith(stocks: [...state.stocks, ...newStocks]));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
