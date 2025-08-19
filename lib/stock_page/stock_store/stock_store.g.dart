// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Stock on _Stock, Store {
  late final _$currentPriceAtom = Atom(
    name: '_Stock.currentPrice',
    context: context,
  );

  @override
  double get currentPrice {
    _$currentPriceAtom.reportRead();
    return super.currentPrice;
  }

  @override
  set currentPrice(double value) {
    _$currentPriceAtom.reportWrite(value, super.currentPrice, () {
      super.currentPrice = value;
    });
  }

  late final _$previousPriceAtom = Atom(
    name: '_Stock.previousPrice',
    context: context,
  );

  @override
  double? get previousPrice {
    _$previousPriceAtom.reportRead();
    return super.previousPrice;
  }

  @override
  set previousPrice(double? value) {
    _$previousPriceAtom.reportWrite(value, super.previousPrice, () {
      super.previousPrice = value;
    });
  }

  @override
  String toString() {
    return '''
currentPrice: ${currentPrice},
previousPrice: ${previousPrice}
    ''';
  }
}

mixin _$StockStore on _StockStore, Store {
  late final _$stocksAtom = Atom(name: '_StockStore.stocks', context: context);

  @override
  ObservableList<Stock> get stocks {
    _$stocksAtom.reportRead();
    return super.stocks;
  }

  @override
  set stocks(ObservableList<Stock> value) {
    _$stocksAtom.reportWrite(value, super.stocks, () {
      super.stocks = value;
    });
  }

  late final _$isStreamingAtom = Atom(
    name: '_StockStore.isStreaming',
    context: context,
  );

  @override
  bool get isStreaming {
    _$isStreamingAtom.reportRead();
    return super.isStreaming;
  }

  @override
  set isStreaming(bool value) {
    _$isStreamingAtom.reportWrite(value, super.isStreaming, () {
      super.isStreaming = value;
    });
  }

  late final _$_StockStoreActionController = ActionController(
    name: '_StockStore',
    context: context,
  );

  @override
  void startStreaming() {
    final _$actionInfo = _$_StockStoreActionController.startAction(
      name: '_StockStore.startStreaming',
    );
    try {
      return super.startStreaming();
    } finally {
      _$_StockStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopStreaming() {
    final _$actionInfo = _$_StockStoreActionController.startAction(
      name: '_StockStore.stopStreaming',
    );
    try {
      return super.stopStreaming();
    } finally {
      _$_StockStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stocks: ${stocks},
isStreaming: ${isStreaming}
    ''';
  }
}
