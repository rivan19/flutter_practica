import 'package:everpobre/Scenes/notebook_scene.dart';
import 'package:everpobre/domain/messages.dart';
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
  final Notebook model = Notebook.testDataBuilder();
  
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


class NoteBooksListView extends StatefulWidget{
  final Notebooks _model;

  const NoteBooksListView(Notebooks model) : _model = model;

  @override
  _NoteBooksListViewState createState() => _NoteBooksListViewState();
}


class _NoteBooksListViewState extends State<NoteBooksListView> {

  void modelDidChange(){
    setState(() {
      
    });
  }

  @override
  void didChangeDependencies(){
    widget._model.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  void dispose(){
    widget._model.removeListener(modelDidChange);
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._model.length,
      itemBuilder: (context, index){
        return NoteBookSliver(widget._model, index);
    });
  }
}

class NoteBookSliver extends StatefulWidget {
  final Notebooks notebooks;
  final int index;

  const NoteBookSliver(Notebooks _notebooks, int _index) :
  notebooks = _notebooks,
  index = _index;

  @override
  _NoteBookSliverState createState() => _NoteBookSliverState();
}

class _NoteBookSliverState extends State<NoteBookSliver> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(), 
      onDismissed: (direction) {
        widget.notebooks.removeAt(widget.index);

        Scaffold.of(context).showSnackBar(
          const SnackBar(content: Text("NoteBook has been deleted!"),
          )
        );
        setState((){});
      },
      background: Container(
        color: Colors.red
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => 
          NoteBookListView(widget.notebooks[widget.index])),
          //Navigator.pushNamed(context, NoteBookListView.routeName,
          //arguments: MessageNotebook(widget.notebooks[widget.index]));
          );
          
        },
        child:Card(
        child: ListTile(
          leading: const Icon(Icons.toc),
          title: Text(widget.notebooks[widget.index].title),
        ),
      ),
      ),
    );
  }
}
