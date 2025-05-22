// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioImpl _$$AudioImplFromJson(Map<String, dynamic> json) => _$AudioImpl(
      id: json['_id'] as String,
      artist: json['artist'] as String,
      title: json['title'] as String,
      time: json['time'] as String?,
      createdAt: json['createdAt'] as String,
      description: json['description'] as String,
      languange: json['languange'] as String,
      isPremium: json['isPremium'] as String,
      path: (json['path'] as List<dynamic>)
          .map((e) => PathFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: (json['thumbnail'] as List<dynamic>)
          .map((e) => PathFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AudioImplToJson(_$AudioImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'artist': instance.artist,
      'title': instance.title,
      'time': instance.time,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'languange': instance.languange,
      'isPremium': instance.isPremium,
      'path': instance.path,
      'thumbnail': instance.thumbnail,
    };
