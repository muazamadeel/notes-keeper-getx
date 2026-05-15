import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/note.dart';

class FirebaseService {
  final CollectionReference _notesCollection = FirebaseFirestore.instance
      .collection('notes');

  Future<void> addOrUpdateNote(Note note) async {
    if (note.id != null) {
      await _notesCollection.doc(note.id.toString()).set(note.toFirestore());
    } else {
      await _notesCollection.add(note.toFirestore());
    }
  }

  Future<void> deleteNote(Note note) async {
    if (note.id != null) {
      await _notesCollection.doc(note.id.toString()).delete();
    }
  }
}
