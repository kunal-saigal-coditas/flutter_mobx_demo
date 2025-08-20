class StockModel {
  final String symbol;
  final double currentPrice;
  final double? previousPrice;

  StockModel({
    required this.symbol,
    required this.currentPrice,
    this.previousPrice,
  });

  StockModel copyWith({double? currentPrice, double? previousPrice}) {
    return StockModel(
      symbol: symbol,
      currentPrice: currentPrice ?? this.currentPrice,
      previousPrice: previousPrice ?? this.previousPrice,
    );
  }
}
