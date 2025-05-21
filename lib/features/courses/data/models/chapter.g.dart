// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterImpl _$$ChapterImplFromJson(Map<String, dynamic> json) =>
    _$ChapterImpl(
      id: json['_id'] as String,
      coursesId: (json['coursesId'] as List<dynamic>)
          .map((e) => IdTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
      lesson: (json['lesson'] as List<dynamic>)
          .map((e) => IdTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$ChapterImplToJson(_$ChapterImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'coursesId': instance.coursesId,
      'lesson': instance.lesson,
      'title': instance.title,
      'createdAt': instance.createdAt,
    };
