import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx_demo/stock_page_with_bloc/bloc/stock_page_bloc.dart';

class StockScreenWithBloc extends StatelessWidget {
  const StockScreenWithBloc({super.key});

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
    return BlocProvider(
      create: (_) => StockBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Live Stock Market (BLoC)")),
        body: BlocBuilder<StockBloc, StockState>(
          builder: (context, state) {
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: state.stocks.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final stock = state.stocks[index];
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
        floatingActionButton: BlocBuilder<StockBloc, StockState>(
          builder: (context, state) {
            return FloatingActionButton.extended(
              icon: Icon(state.isStreaming ? Icons.stop : Icons.play_arrow),
              label: Text(state.isStreaming ? "Stop" : "Start"),
              onPressed: () {
                final bloc = context.read<StockBloc>();
                if (state.isStreaming) {
                  bloc.add(StopStockStream());
                } else {
                  bloc.add(AddManyStocks());
                  bloc.add(StartStockStream());
                }
              },
            );
          },
        ),
      ),
    );
  }
}
