import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/courses/data/models/lesson.dart';
import 'package:talent_insider/features/courses/domain/repositories/courses_repository.dart';

class GetLessonById {
  final CoursesRepository repository;

  GetLessonById({required this.repository});

  Future<ResultState<Lesson>> call(String id) async {
    return repository.getLessonById(id);
  }
}
