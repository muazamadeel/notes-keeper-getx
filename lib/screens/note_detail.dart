import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/note_controller.dart';
import '../models/note.dart';

class NoteDetail extends StatelessWidget {
  final Note note;
  final NoteController controller = Get.find();

  NoteDetail(this.note, {super.key});

  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final RxInt priority = 2.obs;

  @override
  Widget build(BuildContext context) {
    titleCtrl.text = note.title;
    descCtrl.text = note.description;
    priority.value = note.priority;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(note.id == null ? 'Add Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Obx(
              () => DropdownButton<int>(
                value: priority.value,
                // isExpanded: true,
                items: const [
                  DropdownMenuItem(value: 1, child: Text('High')),
                  DropdownMenuItem(value: 2, child: Text('Low')),
                ],
                onChanged: (val) {
                  priority.value = val!;
                },
              ),
            ),
            TextField(
              controller: titleCtrl,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),

            TextField(
              controller: descCtrl,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text('Save'),
                    onPressed: () {
                      final newNote = Note(
                        id: note.id,
                        title: titleCtrl.text,
                        description: descCtrl.text,
                        priority: priority.value,
                        date: DateFormat.yMMMd().format(DateTime.now()),
                      );
                      controller.addOrUpdateNote(newNote);
                      Get.back();
                    },
                  ),
                ),
                SizedBox(width: 10),
                if (note.id != null)
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Delete'),
                      onPressed: () {
                        controller.deleteNote(note);
                        Get.back();
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
