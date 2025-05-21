part of 'courses_bloc.dart';

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
