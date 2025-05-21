import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/courses/data/models/chapter.dart';
import 'package:talent_insider/features/courses/data/models/course.dart';
import 'package:talent_insider/features/courses/data/models/lesson.dart';

abstract interface class CoursesRepository {
  Future<ResultState<List<Course>>> getCourses();
  Future<ResultState<Course>> getCourseById(String id);
  Future<ResultState<Chapter>> getChapterById(String id);
  Future<ResultState<Lesson>> getLessonById(String id);
}
