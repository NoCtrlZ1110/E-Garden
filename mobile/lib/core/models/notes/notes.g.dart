// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notes _$NotesFromJson(Map<String, dynamic> json) {
  return Notes(
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NotesToJson(Notes instance) => <String, dynamic>{
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
    };

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    userId: json['userId'] as int,
    startTime: json['startTime'] as String,
    endTime: json['endTime'] as String,
    date: json['date'] as String,
    titleNote: json['titleNote'] as String,
    detailNote: json['detailNote'] as String,
    status: json['status'] as bool,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'userId': instance.userId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'date': instance.date,
      'titleNote': instance.titleNote,
      'detailNote': instance.detailNote,
      'status': instance.status,
      'id': instance.id,
    };
