import 'package:get_it/get_it.dart';
import 'package:talent_insider/features/audio_book/data/repositories/audio_book_repository_impl.dart';
import 'package:talent_insider/features/audio_book/domain/repositories/audio_book_repository.dart';
import 'package:talent_insider/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:talent_insider/features/authentication/data/repositories/user_data_store_repository_impl.dart';
import 'package:talent_insider/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:talent_insider/features/authentication/domain/repositories/user_data_store_repository.dart';
import 'package:talent_insider/features/courses/data/repositories/courses_repository_impl.dart';
import 'package:talent_insider/features/courses/domain/repositories/courses_repository.dart';

final GetIt sl = GetIt.instance;

void initRepositories() {
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authApi: sl(),
      userDataStoreRepository: sl(),
    ),
  );

  sl.registerLazySingleton<UserDataStoreRepository>(
    () => UserDataStoreRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<CoursesRepository>(
    () => CoursesRepositoryImpl(
      courseApi: sl(),
    ),
  );

  sl.registerLazySingleton<AudioBookRepository>(
    () => AudioBookRepositoryImpl(
      audioApi: sl(),
    ),
  );
}
