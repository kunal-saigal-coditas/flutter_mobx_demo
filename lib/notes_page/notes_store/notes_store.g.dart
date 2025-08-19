// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesStore on _NotesStore, Store {
  late final _$notesAtom = Atom(name: '_NotesStore.notes', context: context);

  @override
  ObservableList<String> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<String> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$_NotesStoreActionController = ActionController(
    name: '_NotesStore',
    context: context,
  );

  @override
  void addNote(String note) {
    final _$actionInfo = _$_NotesStoreActionController.startAction(
      name: '_NotesStore.addNote',
    );
    try {
      return super.addNote(note);
    } finally {
      _$_NotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteNoteAt(int index) {
    final _$actionInfo = _$_NotesStoreActionController.startAction(
      name: '_NotesStore.deleteNoteAt',
    );
    try {
      return super.deleteNoteAt(index);
    } finally {
      _$_NotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes}
    ''';
  }
}
