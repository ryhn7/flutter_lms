import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/courses/data/models/chapter.dart';
import 'package:talent_insider/features/courses/data/models/course.dart';
import 'package:talent_insider/features/courses/data/models/lesson.dart';
import 'package:talent_insider/features/courses/data/remote/course_api.dart';
import 'package:talent_insider/features/courses/domain/repositories/courses_repository.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  final CourseApi _courseApi;

  CoursesRepositoryImpl({
    required CourseApi courseApi,
  }) : _courseApi = courseApi;

  @override
  Future<ResultState<Chapter>> getChapterById(String id) async {
    try {
      final response = await _courseApi.getChapterById(id);
      return ResultState.success(response);
    } catch (e) {
      return ResultState.error(e.toString());
    }
  }

  @override
  Future<ResultState<Course>> getCourseById(String id) async {
    try {
      final response = await _courseApi.getCourseById(id);
      return ResultState.success(response);
    } catch (e) {
      return ResultState.error(e.toString());
    }
  }

  @override
  Future<ResultState<List<Course>>> getCourses() async {
    try {
      final response = await _courseApi.getCourses();
      return ResultState.success(response);
    } catch (e) {
      return ResultState.error(e.toString());
    }
  }

  @override
  Future<ResultState<Lesson>> getLessonById(String id) async {
    try {
      final response = await _courseApi.getLessonById(id);
      return ResultState.success(response);
    } catch (e) {
      return ResultState.error(e.toString());
    }
  }
}
