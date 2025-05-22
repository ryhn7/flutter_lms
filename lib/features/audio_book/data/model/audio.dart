import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talent_insider/features/courses/data/models/path_file.dart';

part 'audio.freezed.dart';
part 'audio.g.dart';

@freezed
class Audio with _$Audio {
  factory Audio({
    @JsonKey(name: '_id') required String id,
    required String artist,
    required String title,
    String? time,
    required String createdAt,
    required String description,
    required String languange,
    required String isPremium,
    required List<PathFile> path,
    required List<PathFile> thumbnail,
  }) = _Audio;

  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);
}
