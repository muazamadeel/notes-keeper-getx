import 'package:get/get.dart';

import '../database_helper.dart';
import '../models/note.dart';
import '../services/firebase_service.dart';

class NoteController extends GetxController {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final FirebaseService _firebase = FirebaseService();

  RxList<Note> notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }

  void loadNotes() async {
    notes.value = await _dbHelper.getNotes();
  }

  void addOrUpdateNote(Note note) async {
    if (note.id == null) {
      int id = await _dbHelper.insertNote(note);
      note.id = id;
    } else {
      await _dbHelper.updateNote(note);
    }
    await _firebase.addOrUpdateNote(note);
    loadNotes();
  }

  void deleteNote(Note note) async {
    if (note.id != null) await _dbHelper.deleteNote(note.id!);
    await _firebase.deleteNote(note);
    loadNotes();
  }
}
