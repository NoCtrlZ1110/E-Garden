// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notes _$NotesFromJson(Map<String, dynamic> json) {
  return Notes(
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Note.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NotesToJson(Notes instance) => <String, dynamic>{
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
    };

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    userId: json['userId'] as int,
    hexCode: json['hexCode'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    startTime: json['startTime'] as String,
    endTime: json['endTime'] as String,
    titleNote: json['titleNote'] as String,
    detailNote: json['detailNote'] as String,
    status: json['status'] as bool,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'userId': instance.userId,
      'date': instance.date?.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'hexCode': instance.hexCode,
      'titleNote': instance.titleNote,
      'detailNote': instance.detailNote,
      'status': instance.status,
      'id': instance.id,
    };
