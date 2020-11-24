import 'package:json_annotation/json_annotation.dart';
part 'dictionary.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Dictionary {
  String word;
  List<Phonetics> phonetics;
  List<Meanings> meanings;

  Dictionary({this.word, this.phonetics, this.meanings});
  factory Dictionary.fromJson(Map<String, dynamic> json) => _$DictionaryFromJson(json);

  Map<String, dynamic> toJson() => _$DictionaryToJson(this);


}
@JsonSerializable(nullable: true, explicitToJson: true)
class Phonetics {
  String text;
  String audio;

  Phonetics({this.text, this.audio});
  factory  Phonetics.fromJson(Map<String, dynamic> json) => _$PhoneticsFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneticsToJson(this);

}
@JsonSerializable(nullable: true, explicitToJson: true)
class Meanings {
  String partOfSpeech;
  List<Definitions> definitions;

  Meanings({this.partOfSpeech, this.definitions});
  factory Meanings.fromJson(Map<String, dynamic> json) => _$MeaningsFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningsToJson(this);


}
@JsonSerializable(nullable: true, explicitToJson: true)
class Definitions {
  String definition;
  String example;
  List<String> synonyms;

  Definitions({this.definition, this.example, this.synonyms});
  factory Definitions.fromJson(Map<String, dynamic> json) => _$DefinitionsFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionsToJson(this);


}
