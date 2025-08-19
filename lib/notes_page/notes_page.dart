/* This project demonstrates:
1. How to use MobX for state management.
2. Adding notes via a BottomSheet.
3. Displaying notes in a ListView. */

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_demo/notes_page/notes_store/notes_store.dart';

final NotesStore notesStore = NotesStore();

class NotesHomePage extends StatelessWidget {
  const NotesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MobX Notes")),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: notesStore.notes.length,
          itemBuilder: (context, index) {
            final note = notesStore.notes[index];

            return Dismissible(
              key: ValueKey(note + index.toString()),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (_) => notesStore.deleteNoteAt(index),
              child: ListTile(title: Text(note)),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNoteSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Function to show bottom sheet for adding notes
  void _showAddNoteSheet(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Enter note',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                notesStore.addNote(controller.text);
                Navigator.pop(context);
              },
              child: const Text("Add Note"),
            ),
          ],
        ),
      ),
    );
  }
}
