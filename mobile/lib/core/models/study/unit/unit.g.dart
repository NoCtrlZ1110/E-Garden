// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListUnit _$ListUnitFromJson(Map<String, dynamic> json) {
  return ListUnit(
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Unit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListUnitToJson(ListUnit instance) => <String, dynamic>{
  'items': instance.items?.map((e) => e?.toJson())?.toList(),
};

Unit _$UnitFromJson(Map<String, dynamic> json) {
  return Unit(
    name: json['name'] as String,
    description: json['description'] as String,
    bookId: json['bookId'] as int,
    totalWord: json['totalWord'] as int,
    totalSentence: json['totalSentence'] as int,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'bookId': instance.bookId,
  'totalWord': instance.totalWord,
  'totalSentence': instance.totalSentence,
  'id': instance.id,
};