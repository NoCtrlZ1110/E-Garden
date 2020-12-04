import 'package:json_annotation/json_annotation.dart';
part 'notes.g.dart';
@JsonSerializable(nullable: true, explicitToJson: true)

class Notes {
  List<Items> items;

  Notes({this.items});
  factory Notes.fromJson(Map<String, dynamic> json) => _$NotesFromJson(json);

  Map<String, dynamic> toJson() => _$NotesToJson(this);

}
@JsonSerializable(nullable: true, explicitToJson: true)

class Items {
  int userId;
  String startTime;
  String endTime;
  String date;
  String titleNote;
  String detailNote;
  bool status;
  int id;

  Items(
      {this.userId,
        this.startTime,
        this.endTime,
        this.date,
        this.titleNote,
        this.detailNote,
        this.status,
        this.id});
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}