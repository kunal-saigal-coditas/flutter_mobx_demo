import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_demo/stream_page/storage_store/stream_store.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  final store = StreamStore();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MobX Stream Example")),
      body: Center(
        child: Observer(
          builder: (_) {
            if (store.isLoading) {
              return const CircularProgressIndicator();
            }
            if (store.value == null) {
              return const Text("Press start to listen to stream");
            }
            return Text(
              "Stream Value: ${store.value}",
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          store.startListening();
        },
      ),
    );
  }
}
