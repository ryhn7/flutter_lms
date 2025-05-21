import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talent_insider/features/courses/data/models/id_title.dart';
import 'package:talent_insider/features/courses/data/models/path_file.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@freezed
class Lesson with _$Lesson {
  factory Lesson({
    @JsonKey(name: '_id') required String id,
    required List<IdTitle> chapterId,
    required List<PathFile> path,
    required String title,
    required String createdAt,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}
