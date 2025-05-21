import 'package:talent_insider/features/courses/domain/usecases/get_chapter_by_id.dart';
import 'package:talent_insider/features/courses/domain/usecases/get_course_by_id.dart';
import 'package:talent_insider/features/courses/domain/usecases/get_courses.dart';
import 'package:talent_insider/features/courses/domain/usecases/get_lesson_by_id.dart';

class UsecaseCourses {
  final GetCourses getCourses;
  final GetCourseById getCourseById;
  final GetChapterById getChapterById;
  final GetLessonById getLessonById;

  UsecaseCourses({
    required this.getCourses,
    required this.getCourseById,
    required this.getChapterById,
    required this.getLessonById,
  });
}
