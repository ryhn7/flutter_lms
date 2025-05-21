import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/courses/data/models/chapter.dart';
import 'package:talent_insider/features/courses/data/models/course.dart';
import 'package:talent_insider/features/courses/data/models/lesson.dart';
import 'package:talent_insider/features/courses/domain/usecases/usecase_courses.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_event.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final UsecaseCourses _usecases;

  CoursesBloc({
    required UsecaseCourses usecases,
  })  : _usecases = usecases,
        super(const CoursesState.initial()) {
    on<CoursesEvent>((event, emit) async {
      await event.when(
        getCoursesRequested: () => _onGetCoursesRequested(emit),
        getCourseByIdRequested: (id) => _onGetCourseByIdRequested(id, emit),
        getChapterByIdRequested: (id) => _onGetChapterByIdRequested(id, emit),
        getLessonByIdRequested: (id) => _onGetLessonByIdRequested(id, emit),
      );
    });
  }

  Future<void> _onGetCoursesRequested(Emitter<CoursesState> emit) async {
    emit(const CoursesState.loading());

    try {
      final result = await _usecases.getCourses();

      if (result is Success<List<Course>>) {
        emit(CoursesState.coursesLoaded(result.data));
      } else if (result is Error<List<Course>>) {
        emit(CoursesState.error(result.message));
      } else {
        emit(const CoursesState.error('Unexpected error occurred'));
      }
    } catch (e) {
      emit(CoursesState.error('An exception occurred: ${e.toString()}'));
    }
  }

  Future<void> _onGetCourseByIdRequested(
      String id, Emitter<CoursesState> emit) async {
    emit(const CoursesState.loading());

    try {
      final result = await _usecases.getCourseById(id);

      if (result is Success<Course>) {
        emit(CoursesState.courseLoaded(result.data));
      } else if (result is Error<Course>) {
        emit(CoursesState.error(result.message));
      } else {
        emit(const CoursesState.error('Unexpected error occurred'));
      }
    } catch (e) {
      emit(CoursesState.error('An exception occurred: ${e.toString()}'));
    }
  }

  Future<void> _onGetChapterByIdRequested(
      String id, Emitter<CoursesState> emit) async {
    emit(const CoursesState.loading());

    try {
      final result = await _usecases.getChapterById(id);

      if (result is Success<Chapter>) {
        emit(CoursesState.chapterLoaded(result.data));
      } else if (result is Error<Chapter>) {
        emit(CoursesState.error(result.message));
      } else {
        emit(const CoursesState.error('Unexpected error occurred'));
      }
    } catch (e) {
      emit(CoursesState.error('An exception occurred: ${e.toString()}'));
    }
  }

  Future<void> _onGetLessonByIdRequested(
      String id, Emitter<CoursesState> emit) async {
    emit(const CoursesState.loading());

    try {
      final result = await _usecases.getLessonById(id);

      if (result is Success<Lesson>) {
        emit(CoursesState.lessonLoaded(result.data));
      } else if (result is Error<Lesson>) {
        emit(CoursesState.error(result.message));
      } else {
        emit(const CoursesState.error('Unexpected error occurred'));
      }
    } catch (e) {
      emit(CoursesState.error('An exception occurred: ${e.toString()}'));
    }
  }
}
