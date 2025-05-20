import 'package:get_it/get_it.dart';
import 'package:talent_insider/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:talent_insider/features/authentication/data/repositories/user_data_store_repository_impl.dart';
import 'package:talent_insider/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:talent_insider/features/authentication/domain/repositories/user_data_store_repository.dart';

final GetIt sl = GetIt.instance;

void initRepositories() {
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      apiConfig: sl(),
      userDataStoreRepository: sl(),
    ),
  );

  sl.registerLazySingleton<UserDataStoreRepository>(
    () => UserDataStoreRepositoryImpl(sl()),
  );
}
