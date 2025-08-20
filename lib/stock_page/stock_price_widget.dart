import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_demo/stock_page/stock_store/stock_store.dart';

class StockPriceWidget extends StatelessWidget {
  final Stock stock;
  const StockPriceWidget({super.key, required this.stock});

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

        return Row(
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
        );
      },
    );
  }
}
