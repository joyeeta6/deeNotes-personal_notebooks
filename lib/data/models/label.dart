import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:notebooks/features/note/data/models/note_model.dart';

class Label {
  int? id;
  String name;
  List<NoteModel>? notes;
  Label({
    this.id,
    required this.name,
    this.notes,
  });

  Label copyWith({
    int? id,
    String? name,
    List<NoteModel>? notes,
  }) {
    return Label(
      id: id ?? this.id,
      name: name ?? this.name,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'notes': notes?.map((x) => x.toMap()).toList(),
    };
  }

  factory Label.fromMap(Map<String, dynamic> map) {
    return Label(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      notes: map['notes'] != null
          ? List<NoteModel>.from(map['notes']?.map((x) => NoteModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Label.fromJson(String source) => Label.fromMap(json.decode(source));

  @override
  String toString() => 'Label(id: $id, name: $name, notes: $notes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Label &&
        other.id == id &&
        other.name == name &&
        listEquals(other.notes, notes);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ notes.hashCode;
}
