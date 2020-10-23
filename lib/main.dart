import 'package:everpobre/Scenes/notebook_scene.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';



//final Notebooks model = Notebooks.testDataBuilder();
//final Notebook model = Notebook.testDataBuilder();
void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  final Notebook model = Notebook.testDataBuilder();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        NoteBookListView.routeName: (context) => NoteBookListView(model),
      },
      initialRoute: NoteBookListView.routeName,
    );
  }
}
