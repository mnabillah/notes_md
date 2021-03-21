import 'package:flutter/material.dart';
import 'package:notes_md/model/note.dart';

class EditNoteScreen extends StatefulWidget {
  late Note _note;

  EditNoteScreen({Note? note}) {
    this._note = note ?? Note(id: '2');
  }

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(''),
          elevation: 0,
          backgroundColor: widget._note.color,
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Title'),
                  style: Theme.of(context).textTheme.headline5,
                  initialValue: widget._note.title ?? null,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Note'),
                  style: Theme.of(context).textTheme.bodyText1,
                  initialValue: widget._note.content ?? null,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: widget._note.color,
      );
}
