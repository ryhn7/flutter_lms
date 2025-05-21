import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/courses/data/models/course.dart';
import 'package:talent_insider/features/courses/domain/repositories/courses_repository.dart';

class GetCourses {
  final CoursesRepository repository;

  GetCourses({required this.repository});

  Future<ResultState<List<Course>>> call() async {
    return repository.getCourses();
  }
}
  