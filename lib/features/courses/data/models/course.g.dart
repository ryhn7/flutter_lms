// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseImpl _$$CourseImplFromJson(Map<String, dynamic> json) => _$CourseImpl(
      id: json['_id'] as String,
      author: json['author'] as String?,
      category: json['category'] as String?,
      chapter: (json['chapter'] as List<dynamic>)
          .map((e) => IdTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: (json['path'] as List<dynamic>)
          .map((e) => PathFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      createdAt: json['createdAt'] as String,
      duration: json['duration'] as String?,
      isNew: json['isNew'] as bool?,
      level: json['level'] as String?,
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      instructorImageUrl: json['instructorImageUrl'] as String?,
      instructorFlag: json['instructorFlag'] as String?,
    );

Map<String, dynamic> _$$CourseImplToJson(_$CourseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'author': instance.author,
      'category': instance.category,
      'chapter': instance.chapter,
      'path': instance.path,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'duration': instance.duration,
      'isNew': instance.isNew,
      'level': instance.level,
      'description': instance.description,
      'tags': instance.tags,
      'thumbnailUrl': instance.thumbnailUrl,
      'instructorImageUrl': instance.instructorImageUrl,
      'instructorFlag': instance.instructorFlag,
    };
