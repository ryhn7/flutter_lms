import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talent_insider/features/courses/data/models/id_title.dart';
import 'package:talent_insider/features/courses/data/models/path_file.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
class Chapter with _$Chapter {
  factory Chapter({
    @JsonKey(name: '_id') required String id,
    required List<IdTitle> coursesId,
    required List<IdTitle> lesson,
    required String title,
    required String createdAt,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}
