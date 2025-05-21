import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/courses/data/models/course.dart';
import 'package:talent_insider/features/courses/domain/repositories/courses_repository.dart';

class GetCourseById {
  final CoursesRepository repository;

  GetCourseById({required this.repository});

  Future<ResultState<Course>> call(String id) async {
    return repository.getCourseById(id);
  }
}
