import 'package:json_annotation/json_annotation.dart';
part 'notes.g.dart';
@JsonSerializable(nullable: true, explicitToJson: true)

class Notes {
  List<Note> items;

  Notes({this.items});
  factory Notes.fromJson(Map<String, dynamic> json) => _$NotesFromJson(json);

  Map<String, dynamic> toJson() => _$NotesToJson(this);

}
@JsonSerializable(nullable: true, explicitToJson: true)

class Note {
  int userId;
  DateTime date;
  String startTime;
  String endTime;
  String hexCode;
  String titleNote;
  String detailNote;
  bool status;
  int id;

  Note(
      {this.userId,
        this.hexCode,
        this.date,
        this.startTime,
        this.endTime,
        this.titleNote,
        this.detailNote,
        this.status,
        this.id});
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}