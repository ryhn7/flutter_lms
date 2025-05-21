import 'package:talent_insider/core/network/api_config.dart';
import 'package:talent_insider/features/courses/data/models/chapter.dart';
import 'package:talent_insider/features/courses/data/models/course.dart';
import 'package:talent_insider/features/courses/data/models/lesson.dart';

class CourseApi {
  final ApiConfig apiConfig;

  CourseApi({required this.apiConfig});

  Future<List<Course>> getCourses() async {
    try {
      final response = await apiConfig.getApi<List<Course>>(
        '/courses?\$lookup=*',
        requiresAuth: false,
        decoder: (json) => (json as List).map((e) => Course.fromJson(e)).toList(),
      );

      return response;
    } catch (e) {
      throw Exception('Failed to get courses: $e');
    }
  }

  Future<Course> getCourseById(String id) async {
    try {
      final response = await apiConfig.getApi<Course>(
        '/courses/$id?\$lookup=*',
        requiresAuth: false,
        decoder: (json) => Course.fromJson(json),
      );

      return response;
    } catch (e) {
      throw Exception('Failed to get course by id: $e');
    }
  }

  Future<Chapter> getChapterById(String id) async {
    try {
      final response = await apiConfig.getApi<Chapter>(
        '/chapter/$id?\$lookup=*',
        requiresAuth: false,
        decoder: (json) => Chapter.fromJson(json),
      );

      return response;
    } catch (e) {
      throw Exception('Failed to get chapter by id: $e');
    }
  }

  Future<Lesson> getLessonById(String id) async {
    try {
      final response = await apiConfig.getApi<Lesson>(
        '/lesson/$id?\$lookup=*',
        requiresAuth: false,
        decoder: (json) => Lesson.fromJson(json),
      );

      return response;
    } catch (e) {
      throw Exception('Failed to get lesson by id: $e');
    }
  }
}
