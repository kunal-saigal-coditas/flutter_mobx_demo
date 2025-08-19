// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StreamStore on _StreamStore, Store {
  late final _$valueAtom = Atom(name: '_StreamStore.value', context: context);

  @override
  int? get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int? value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_StreamStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_StreamStoreActionController = ActionController(
    name: '_StreamStore',
    context: context,
  );

  @override
  void startListening() {
    final _$actionInfo = _$_StreamStoreActionController.startAction(
      name: '_StreamStore.startListening',
    );
    try {
      return super.startListening();
    } finally {
      _$_StreamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopListening() {
    final _$actionInfo = _$_StreamStoreActionController.startAction(
      name: '_StreamStore.stopListening',
    );
    try {
      return super.stopListening();
    } finally {
      _$_StreamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
isLoading: ${isLoading}
    ''';
  }
}
