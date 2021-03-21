import 'package:flutter/material.dart';
import 'package:notes_md/model/note.dart';

import 'note_card.dart';

class NotesGrid extends StatelessWidget {
  final List<Note> notes;
  final void Function(Note)? onTap;

  NotesGrid({Key? key, required this.notes, this.onTap}) : super(key: key);

  static NotesGrid create({Key? key, notes, onTap}) =>
      NotesGrid(key: key, notes: notes, onTap: onTap);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1 / 1.2,
        ),
        delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) =>
                _noteItem(context, notes[index]),
            childCount: notes.length),
      ),
    );
  }

  Widget _noteItem(BuildContext context, Note note) => InkWell(
        onTap: () => onTap?.call(note),
        child: NoteCard(note: note),
      );
}
