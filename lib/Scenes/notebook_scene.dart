import 'package:everpobre/Scenes/notes_scene.dart';
import 'package:everpobre/text_resources.dart';
import 'package:everpobre/domain/note.dart';

import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';

class NoteBookListView extends StatefulWidget {
  final Notebook _model;

  const NoteBookListView(Notebook model) : _model = model;

  static const routeName = "/Notebook";

  @override
  _NoteBookListViewState createState() => _NoteBookListViewState();
}

class _NoteBookListViewState extends State<NoteBookListView> {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF388E3C),
        accentColor: const Color(0xFFFFC107),
      ),
      title: TextResources.appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(TextResources.appName),
        ),
        body: NotesListView(widget._model),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget._model.add(Note("Una nueva nota"));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}