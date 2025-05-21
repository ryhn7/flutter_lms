import 'package:get_it/get_it.dart';
import 'package:talent_insider/features/authentication/domain/usecases/login.dart';
import 'package:talent_insider/features/authentication/domain/usecases/logout.dart';
import 'package:talent_insider/features/authentication/domain/usecases/set_seen_onboarding_usecase.dart';
import 'package:talent_insider/features/authentication/domain/usecases/usecase_auth.dart';
import 'package:talent_insider/features/courses/domain/usecases/get_chapter_by_id.dart';
import 'package:talent_insider/features/courses/domain/usecases/get_course_by_id.dart';
import 'package:talent_insider/features/courses/domain/usecases/get_courses.dart';
import 'package:talent_insider/features/courses/domain/usecases/get_lesson_by_id.dart';
import 'package:talent_insider/features/courses/domain/usecases/usecase_courses.dart';

final GetIt sl = GetIt.instance;

void initUseCases() {
  // Authentication use cases
  sl.registerLazySingleton(() => Login(repository: sl()));
  sl.registerLazySingleton(() => Logout(repository: sl()));

  // Courses use cases
  sl.registerLazySingleton(() => GetCourses(repository: sl()));
  sl.registerLazySingleton(() => GetCourseById(repository: sl()));
  sl.registerLazySingleton(() => GetChapterById(repository: sl()));
  sl.registerLazySingleton(() => GetLessonById(repository: sl()));

  // Use case facades
  sl.registerLazySingleton(() => UsecaseAuth(login: sl(), logout: sl()));
  sl.registerLazySingleton(
    () => UsecaseCourses(
      getCourses: sl(),
      getCourseById: sl(),
      getChapterById: sl(),
      getLessonById: sl(),
    ),
  );

  // implement SetSeenOnboardingUseCase
  sl.registerLazySingleton(() => SetSeenOnboardingUseCase(repository: sl()));
}
