import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_demo/stock_page/stock_price_widget.dart';
import 'package:flutter_mobx_demo/stock_page/stock_store/stock_store.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final store = StockStore();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Stock Market")),
      body: Observer(
        builder: (_) => ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: store.stocks.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final stock = store.stocks[index];

            // each stock row reacts individually
            return Observer(
              builder: (_) {
                return ListTile(
                  leading: CircleAvatar(child: Text(stock.symbol[0])),
                  title: Text(
                    stock.symbol,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Prev: ${stock.previousPrice?.toStringAsFixed(2) ?? "--"}",
                  ),
                  trailing: StockPriceWidget(stock: stock),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: Observer(
        builder: (_) => FloatingActionButton.extended(
          icon: Icon(store.isStreaming ? Icons.stop : Icons.play_arrow),
          label: Text(store.isStreaming ? "Stop" : "Start"),
          onPressed: () {
            if (store.isStreaming) {
              store.stopStreaming();
            } else {
              store.startStreaming();
              store.addManyStocks();
            }
          },
        ),
      ),
    );
  }
}
