import 'package:flutter/material.dart';
import 'package:flutter_mobx_demo/notes_page/notes_page.dart';
import 'package:flutter_mobx_demo/stock_page/stock_page.dart';
import 'package:flutter_mobx_demo/stream_page/stream_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: StockScreen(),
    );
  }
}
