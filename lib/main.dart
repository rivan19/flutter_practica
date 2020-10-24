
import 'package:everpobre/Scenes/notebooks_scene.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';



//final Notebooks model = Notebooks.testDataBuilder();
//final Notebook model = Notebook.testDataBuilder();

void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  //final Notebook model = Notebook.testDataBuilder();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //routes: {    
      //  MainWidget.routeName: (BuildContext context) => MainWidget(),
      //  NoteBookListView.routeName: (BuildContext context) => NoteBookListView(),
      //},
      //initialRoute: MainWidget.routeName,
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget{
  static const routeName = "/";

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final Notebooks modelNotebooks = Notebooks.testDataBuilder();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF388E3C),
        accentColor: const Color(0xFFFFC107),
      ),
      title: TextResources.appName,
    home: Scaffold(appBar: AppBar(
      title: Text(TextResources.appName)
    ),
    body: NoteBooksListView(modelNotebooks),
    floatingActionButton: FloatingActionButton(onPressed: () {
      modelNotebooks.add(Notebook.withTitle("Nuevo Notebook"));
    },
    child: const Icon(Icons.add),
    ),
    ),
  );
  }
}


