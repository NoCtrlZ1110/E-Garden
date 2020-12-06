// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vocabulary _$VocabularyFromJson(Map<String, dynamic> json) {
  return Vocabulary(
    bookId: json['bookId'] as int,
    unitId: json['unitId'] as int,
    key: json['key'] as String,
    meaning: json['meaning'] as String,
    example: json['example'] as String,
    translate: json['translate'] as String,
    ordering: json['ordering'] as int,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$VocabularyToJson(Vocabulary instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'unitId': instance.unitId,
      'key': instance.key,
      'meaning': instance.meaning,
      'example': instance.example,
      'translate': instance.translate,
      'ordering': instance.ordering,
      'id': instance.id,
    };
