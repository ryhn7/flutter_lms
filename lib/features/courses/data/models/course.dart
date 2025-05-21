import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talent_insider/features/courses/data/models/id_title.dart';
import 'package:talent_insider/features/courses/data/models/path_file.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  factory Course({
    @JsonKey(name: '_id') required String id,
    String? author,
    String? category,
    required List<IdTitle> chapter,
    required List<PathFile> path,
    required String title,
    required String createdAt,
    String? duration,
    bool? isNew,
    String? level,
    String? description,
    List<String>? tags,
    String? thumbnailUrl,
    String? instructorImageUrl,
    String? instructorFlag,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
