import 'package:get_it/get_it.dart';
import 'package:talent_insider/features/authentication/presentation/bloc/authentication_bloc.dart';

final GetIt sl = GetIt.instance;

void initBlocs() {
  sl.registerFactory(() => AuthenticationBloc(sl()));
}
