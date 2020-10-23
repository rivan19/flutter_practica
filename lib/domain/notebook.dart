import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';

class Notebook with ChangeNotifier {
  static final shared = Notebook();

  String _title = "";
  final List<Note> _notes = [];

  int get length => _notes.length;

  String get title => _title;
  set title(String newValue) {
    _title = newValue;
    notifyListeners();
  } 

  // Constructores
  Notebook();

  Notebook.testDataBuilder() {
    _notes.addAll(List.generate(100, (index) => Note("Item $index")));
  }

  Notebook.withTitle(String title){
    _title = title;
  }

Notebook.testDataWithTitle(String title){
  Notebook.withTitle(title);
  Notebook.testDataBuilder();
}

  // Accesores
  Note operator [](int index) {
    return _notes[index];
  }

  // Mutadores
  bool remove(Note note) {
    final n = _notes.remove(note);
    notifyListeners();
    return n;
  }

  Note removeAt(int index) {
    final Note n = _notes.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Note note) {
    _notes.insert(0, note);
    notifyListeners();
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notes>";
  }
}
