part of 'stock_page_bloc.dart';

abstract class StockEvent {}

class StartStockStream extends StockEvent {}

class StopStockStream extends StockEvent {}

class UpdateStockPrices extends StockEvent {}

class AddManyStocks extends StockEvent {}
