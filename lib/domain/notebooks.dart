import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';

class Notebooks with ChangeNotifier {
  static final shared = Notebooks();

  final List<Notebook> _listbooks = [];

  int get length => _listbooks.length;

  // Construtores
  Notebooks();

  Notebooks.testDataBuilder(){
    _listbooks.addAll(List.generate(10, (index) => Notebook.testDataBuilder()));
  }

  //Accesores
  Notebook operator [](int index) {
    return _listbooks[index];
  }

  //Mutadores
  bool remove(Notebook notebook) {
    final n = _listbooks.remove(notebook);
    notifyListeners();
    return n;
  }

  Notebook removeAt(int index) {
    final Notebook n = _listbooks.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Notebook notebook) {
    _listbooks.insert(0, notebook);
    notifyListeners();
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notebooks>";
  }
}