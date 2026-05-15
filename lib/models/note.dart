import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  int? id;
  String title;
  String description;
  String date;
  int priority;

  Note({
    this.id,
    required this.title,
    required this.date,
    required this.priority,
    this.description = '',
  });

  // Local DB map
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'title': title,
      'description': description,
      'priority': priority,
      'date': date,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  Note.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      title = map['title'],
      description = map['description'] ?? '',
      priority = map['priority'],
      date = map['date'];

  // Firestore map
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'priority': priority,
      'date': date,
    };
  }

  Note.fromFirestore(DocumentSnapshot doc)
    : id = null,
      title = doc['title'],
      description = doc['description'] ?? '',
      priority = doc['priority'],
      date = doc['date'];
}
