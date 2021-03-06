import 'package:flutter/material.dart';
import 'package:notes_md/model/note.dart';
import 'package:notes_md/styles.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) => Hero(
        tag: 'NoteItem${note.id}',
        child: DefaultTextStyle(
          style: kNoteTextLight,
          child: Container(
            decoration: BoxDecoration(
              color: note.color,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: note.color?.value == 0xFFFFFFFF
                  ? Border.all(color: kBorderColorLight)
                  : null,
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (note.title?.isNotEmpty == true)
                  Text(
                    note.title ?? '',
                    style: kCardTitleLight,
                    maxLines: 1,
                  ),
                if (note.title?.isNotEmpty == true) const SizedBox(height: 14),
                Flexible(
                  flex: 1,
                  child: Text(note.content ??
                      ''), // wrapping using a Flexible to avoid overflow
                ),
              ],
            ),
          ),
        ),
      );
}
