import 'package:get_it/get_it.dart';
import 'package:talent_insider/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_bloc.dart';

final GetIt sl = GetIt.instance;

void initBlocs() {
  sl.registerFactory(() => AuthenticationBloc(sl()));
  sl.registerFactory(() => CoursesBloc(usecases: sl()));
}
