import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/note_controller.dart';
import '../models/note.dart';
import 'note_detail.dart';

class NoteList extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());

  NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Notes')),
      ),
      body: Obx(() {
        if (controller.notes.isEmpty) {
          return Center(
            child: Text(
              "No notes yet 📝",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            final note = controller.notes[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: note.priority == 1
                      ? Colors.red
                      : Colors.yellow,
                  child: Icon(
                    note.priority == 1
                        ? Icons.play_arrow
                        : Icons.keyboard_arrow_right,
                  ),
                ),
                title: Text(note.title),
                subtitle: Text(note.date),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.deleteNote(note),
                ),
                onTap: () => Get.to(() => NoteDetail(note)),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Get.to(() => NoteDetail(Note(title: '', date: '', priority: 2))),
      ),
    );
  }
}
