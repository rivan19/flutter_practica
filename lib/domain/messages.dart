import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/notebooks.dart';

class Message {
  final Notebooks _notebooks;

  Message(Notebooks newValue) : _notebooks = newValue;

  Notebooks get notebooks => _notebooks;
  
}

class MessageNotebook {
  final Notebook _notebook;

  MessageNotebook(Notebook newValue) : _notebook = newValue;

  Notebook get notebook => _notebook;
}