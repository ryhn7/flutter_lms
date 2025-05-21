import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/courses/data/models/chapter.dart';
import 'package:talent_insider/features/courses/domain/repositories/courses_repository.dart';

class GetChapterById {
  final CoursesRepository repository;

  GetChapterById({required this.repository});

  Future<ResultState<Chapter>> call(String id) async {
    return repository.getChapterById(id);
  }
}
