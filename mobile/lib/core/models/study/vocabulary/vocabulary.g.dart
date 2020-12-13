// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListVocabulary _$ListVocabularyFromJson(Map<String, dynamic> json) {
  return ListVocabulary(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : Vocabulary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListVocabularyToJson(ListVocabulary instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
    };

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
    image: json['image'] as String,
    sound: json['sound'] as String,
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
      'image': instance.image,
      'sound': instance.sound,
    };
