// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonImpl _$$LessonImplFromJson(Map<String, dynamic> json) => _$LessonImpl(
      id: json['_id'] as String,
      chapterId: (json['chapterId'] as List<dynamic>)
          .map((e) => IdTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: (json['path'] as List<dynamic>)
          .map((e) => PathFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$LessonImplToJson(_$LessonImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'chapterId': instance.chapterId,
      'path': instance.path,
      'title': instance.title,
      'createdAt': instance.createdAt,
    };
