import 'package:get_it/get_it.dart';
import 'package:talent_insider/core/network/api_config.dart';

final GetIt sl = GetIt.instance;

void initRemote() {
  sl.registerLazySingleton(() => ApiConfig());
}
