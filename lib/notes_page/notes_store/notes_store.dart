import 'package:mobx/mobx.dart';

part 'notes_store.g.dart';

class NotesStore = _NotesStore with _$NotesStore;

abstract class _NotesStore with Store {
  /// Observable list of notes
  @observable
  ObservableList<String> notes = ObservableList<String>();

  /// Action to add a note
  @action
  void addNote(String note) {
    if (note.trim().isNotEmpty) {
      notes.add(note);
    }
  }

  /// Action to delete a note
  @action
  void deleteNoteAt(int index) {
    if (index >= 0 && index < notes.length) {
      notes.removeAt(index);
    }
  }
}
