import 'package:flutter/foundation.dart';
import 'package:notes_md/model/note.dart';

class NotesProvider extends ChangeNotifier {
  final List<Note> notes = [];

  void add(note) {
    notes.add(note);
    notifyListeners();
  }
}
