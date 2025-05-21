import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider/core/utils/simple_bloc_observer.dart';
import 'package:talent_insider/di/injection_container.dart';
import 'package:talent_insider/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:talent_insider/features/courses/presentation/bloc/courses_bloc.dart';
import 'package:talent_insider/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  if (kDebugMode) {
    Bloc.observer = SimpleBlocObserver();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => sl<AuthenticationBloc>(),
        ),
        BlocProvider<CoursesBloc>(
          create: (context) => sl<CoursesBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Talent Insider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFFAA0A24),
            onPrimary: Colors.white,
            surface: Color(0xFF1E1E1E),
            onSurface: Colors.white70,
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
