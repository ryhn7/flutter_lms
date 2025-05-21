part of 'courses_bloc.dart';

@freezed
class CoursesEvent with _$CoursesEvent {
  const factory CoursesEvent.getCoursesRequested() = _GetCoursesRequested;
  const factory CoursesEvent.getCourseByIdRequested(String id) =
      _GetCourseByIdRequested;
  const factory CoursesEvent.getChapterByIdRequested(String id) =
      _GetChapterByIdRequested;
  const factory CoursesEvent.getLessonByIdRequested(String id) =
      _GetLessonByIdRequested;
}
