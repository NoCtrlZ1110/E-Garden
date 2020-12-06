// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBook _$ListBookFromJson(Map<String, dynamic> json) {
  return ListBook(
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Book.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListBookToJson(ListBook instance) => <String, dynamic>{
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
    };

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    name: json['name'] as String,
    description: json['description'] as String,
    bookColor: json['bookColor'] as String,
    bookImage: json['bookImage'] as String,
    grade: json['grade'] as int,
    totalWord: json['totalWord'] as int,
    totalSentence: json['totalSentence'] as int,
    totalUnit: json['totalUnit'] as int,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'bookColor': instance.bookColor,
      'bookImage': instance.bookImage,
      'grade': instance.grade,
      'totalWord': instance.totalWord,
      'totalSentence': instance.totalSentence,
      'totalUnit': instance.totalUnit,
      'id': instance.id,
    };
