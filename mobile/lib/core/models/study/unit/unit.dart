import 'package:json_annotation/json_annotation.dart';
part 'unit.g.dart';
@JsonSerializable(nullable: true, explicitToJson: true)
class ListUnit{
  List<Unit> items;
  ListUnit({this.items});
  factory ListUnit.fromJson(Map<String, dynamic> json) => _$ListUnitFromJson(json);

  Map<String, dynamic> toJson() => _$ListUnitToJson(this);
}
@JsonSerializable(nullable: true, explicitToJson: true)

class Unit {
  String name;
  String description;
  int bookId;
  int totalWord;
  int totalSentence;
  int id;

  Unit(
      {this.name,
        this.description,
        this.bookId,
        this.totalWord,
        this.totalSentence,
        this.id});
  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}