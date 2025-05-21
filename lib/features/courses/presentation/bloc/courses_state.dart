import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talent_insider/features/courses/data/models/chapter.dart';
import 'package:talent_insider/features/courses/data/models/course.dart';
import 'package:talent_insider/features/courses/data/models/lesson.dart';

part 'courses_state.freezed.dart';

@freezed
class CoursesState with _$CoursesState {
  const factory CoursesState.initial() = _Initial;
  const factory CoursesState.loading() = _Loading;
  const factory CoursesState.error(String message) = _Error;
  const factory CoursesState.coursesLoaded(List<Course> courses) =
      _CoursesLoaded;
  const factory CoursesState.courseLoaded(Course course) = _CourseLoaded;
  const factory CoursesState.chapterLoaded(Chapter chapter) = _ChapterLoaded;
  const factory CoursesState.lessonLoaded(Lesson lesson) = _LessonLoaded;
}
