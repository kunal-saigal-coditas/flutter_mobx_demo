import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

  Color _getPriceColor(double? prev, double curr) {
    if (prev == null) return Colors.black;
    if (curr > prev) return Colors.green;
    if (curr < prev) return Colors.red;
    return Colors.black;
  }

  IconData _getTrendIcon(double? prev, double curr) {
    if (prev == null) return Icons.remove;
    if (curr > prev) return Icons.arrow_upward;
    if (curr < prev) return Icons.arrow_downward;
    return Icons.remove;
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
                final priceColor = _getPriceColor(
                  stock.previousPrice,
                  stock.currentPrice,
                );
                final trendIcon = _getTrendIcon(
                  stock.previousPrice,
                  stock.currentPrice,
                );

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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(trendIcon, color: priceColor, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        "\$${stock.currentPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: priceColor,
                        ),
                      ),
                    ],
                  ),
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
            }
          },
        ),
      ),
    );
  }
}
