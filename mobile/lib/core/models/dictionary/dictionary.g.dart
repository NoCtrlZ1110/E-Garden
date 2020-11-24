// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dictionary _$DictionaryFromJson(Map<String, dynamic> json) {
  return Dictionary(
    word: json['word'] as String,
    phonetics: (json['phonetics'] as List)
        ?.map((e) =>
            e == null ? null : Phonetics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    meanings: (json['meanings'] as List)
        ?.map((e) =>
            e == null ? null : Meanings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DictionaryToJson(Dictionary instance) =>
    <String, dynamic>{
      'word': instance.word,
      'phonetics': instance.phonetics?.map((e) => e?.toJson())?.toList(),
      'meanings': instance.meanings?.map((e) => e?.toJson())?.toList(),
    };

Phonetics _$PhoneticsFromJson(Map<String, dynamic> json) {
  return Phonetics(
    text: json['text'] as String,
    audio: json['audio'] as String,
  );
}

Map<String, dynamic> _$PhoneticsToJson(Phonetics instance) => <String, dynamic>{
      'text': instance.text,
      'audio': instance.audio,
    };

Meanings _$MeaningsFromJson(Map<String, dynamic> json) {
  return Meanings(
    partOfSpeech: json['partOfSpeech'] as String,
    definitions: (json['definitions'] as List)
        ?.map((e) =>
            e == null ? null : Definitions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MeaningsToJson(Meanings instance) => <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions?.map((e) => e?.toJson())?.toList(),
    };

Definitions _$DefinitionsFromJson(Map<String, dynamic> json) {
  return Definitions(
    definition: json['definition'] as String,
    example: json['example'] as String,
    synonyms: (json['synonyms'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$DefinitionsToJson(Definitions instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'example': instance.example,
      'synonyms': instance.synonyms,
    };
