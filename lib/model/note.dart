import 'dart:ui';

import 'package:flutter/material.dart';

class Note {
  String? id;
  String? title;
  String? content;
  Color? color;
  NoteState? state;
  final DateTime? createdAt;
  DateTime? modifiedAt;

  /// Instantiates a [Note].
  Note({
    this.id,
    this.title,
    this.content,
    Color? color,
    NoteState? state,
    DateTime? createdAt,
    DateTime? modifiedAt,
  })  : this.color = color ?? Color(0xFFFFFF),
        this.state = state ?? NoteState.unspecified,
        this.createdAt = createdAt ?? DateTime.now(),
        this.modifiedAt = modifiedAt ?? DateTime.now();
}

enum NoteState {
  unspecified,
  pinned,
  archived,
  deleted,
}
