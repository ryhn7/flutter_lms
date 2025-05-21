import 'package:get_it/get_it.dart';
import 'package:talent_insider/core/network/api_config.dart';
import 'package:talent_insider/features/authentication/data/remote/auth_api.dart';
import 'package:talent_insider/features/courses/data/remote/course_api.dart';

final GetIt sl = GetIt.instance;

void initRemote() {
  sl.registerLazySingleton(() => ApiConfig());

  sl.registerLazySingleton(
    () => AuthApi(apiConfig: sl()),
  );

  sl.registerLazySingleton(
    () => CourseApi(apiConfig: sl()),
  );
}
