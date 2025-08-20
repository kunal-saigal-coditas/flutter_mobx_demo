part of 'stock_page_bloc.dart';

class StockState {
  final List<StockModel> stocks;
  final bool isStreaming;

  StockState({required this.stocks, required this.isStreaming});

  StockState copyWith({List<StockModel>? stocks, bool? isStreaming}) {
    return StockState(
      stocks: stocks ?? this.stocks,
      isStreaming: isStreaming ?? this.isStreaming,
    );
  }
}
