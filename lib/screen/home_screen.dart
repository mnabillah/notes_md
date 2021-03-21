import 'package:flutter/material.dart';
import 'package:notes_md/model/note.dart';
import 'package:notes_md/viewmodel/notes_provider.dart';
import 'package:notes_md/viewmodel/theme_provider.dart';
import 'package:notes_md/widget/notes_grid.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  late final String? title;

  HomeScreen({this.title});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    List<Note> notes = Provider.of<NotesProvider>(context).notes;
    return Scaffold(
      body: CustomScrollView(
        slivers: [_sliverAppBar(context), ..._buildNotesView(context, notes)],
      ),
      floatingActionButton: _fab(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _fab(context) => FloatingActionButton(
        onPressed: () {
          Note newNote =
              Note(title: 'Test', content: 'Lorem ipsum', color: Colors.cyan);
          Provider.of<NotesProvider>(context, listen: false).notes.add(newNote);
        },
        tooltip: 'New note',
        child: Icon(Icons.create),
      );

  Widget _sliverAppBar(context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return SliverAppBar(
      expandedHeight: 160.0,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.title ?? '',
          style: TextStyle(
              color: Provider.of<ThemeProvider>(context).getOnColor()),
        ),
        titlePadding: EdgeInsets.all(16.0),
      ),
      actions: [
        InkWell(
          onTap: () {
            themeProvider.switchTheme();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Provider.of<ThemeProvider>(context).getSwitcherIcon(),
              color: Provider.of<ThemeProvider>(context).getOnColor(),
            ),
          ),
        )
      ],
      backgroundColor: Colors.transparent,
    );
  }

  List<Widget> _buildNotesView(BuildContext context, List<Note> notes) {
    if (notes.isEmpty) {
      return [];
    }
    final factory = NotesGrid.create;

    return [factory(notes: notes)];
  }
}
