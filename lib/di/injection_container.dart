import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talent_insider/di/blocs/blocs_di.dart';
import 'package:talent_insider/di/remote/remote_di.dart';
import 'package:talent_insider/di/repositories/repositories_di.dart';
import 'package:talent_insider/di/usecases/usecases_di.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton(sharedPreferences);

  // Initialize dependencies
  initRemote();
  initRepositories();
  initUseCases();
  initBlocs();
}
