import 'package:get_it/get_it.dart';
import 'package:talent_insider/features/authentication/domain/usecases/login.dart';
import 'package:talent_insider/features/authentication/domain/usecases/logout.dart';
import 'package:talent_insider/features/authentication/domain/usecases/usecase_auth.dart';

final GetIt sl = GetIt.instance;

void initUseCases() {
  // Individual use cases
  sl.registerLazySingleton(() => Login(repository: sl()));
  sl.registerLazySingleton(() => Logout(repository: sl()));

  // Use case facades
  sl.registerLazySingleton(() => UsecaseAuth(login: sl(), logout: sl()));
}
