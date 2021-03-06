import 'package:json_annotation/json_annotation.dart';
part 'vocabulary.g.dart';
@JsonSerializable(nullable: true, explicitToJson: true)
class ListVocabulary{
  List<Vocabulary> items;
  ListVocabulary({this.items});
  factory ListVocabulary.fromJson(Map<String, dynamic> json) => _$ListVocabularyFromJson(json);

  Map<String, dynamic> toJson() => _$ListVocabularyToJson(this);
}
@JsonSerializable(nullable: true, explicitToJson: true)
class Vocabulary {
  int bookId;
  int unitId;
  String key;
  String meaning;
  String example;
  String translate;
  int ordering;
  int id;
  String image;
  String sound;

  Vocabulary(
      {this.bookId,
        this.unitId,
        this.key,
        this.meaning,
        this.example,
        this.translate,
        this.ordering,
        this.id, this.image, this.sound});
  factory Vocabulary.fromJson(Map<String, dynamic> json) => _$VocabularyFromJson(json);

  Map<String, dynamic> toJson() => _$VocabularyToJson(this);
}