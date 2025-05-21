import 'package:go_router/go_router.dart';
import 'package:talent_insider/di/injection_container.dart';
import 'package:talent_insider/features/authentication/domain/repositories/user_data_store_repository.dart';
import 'package:talent_insider/features/audio_book/presentation/screens/audio_book_screen.dart';
import 'package:talent_insider/features/audio_book/presentation/screens/detail_audio_book_screen.dart';
import 'package:talent_insider/features/authentication/presentation/screens/login_screen.dart';
import 'package:talent_insider/features/courses/presentation/screens/courses_screen.dart';
import 'package:talent_insider/features/courses/presentation/screens/detail_course_screen.dart';
import 'package:talent_insider/features/courses/presentation/screens/lesson_playing_screen.dart';
import 'package:talent_insider/features/home/presentation/screen/home_screen.dart';
import 'package:talent_insider/features/onboarding/presentation/screen/onboarding_screen.dart';

/// Route names used in the application
class AppRoutes {
  static const String onboarding = 'onboarding';
  static const String login = 'login';
  static const String home = 'home';
  static const String courses = 'courses';
  static const String detailCourse = 'detail-course';
  static const String lessonPlaying = 'lesson-playing';
  static const String audioBook = 'audio-book';
  static const String detailAudioBook = 'detail-audio-book';
}

/// Route paths used in the application
class AppPaths {
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String courses = '/courses';
  static const String detailCourse = '/detail-course';
  static const String lessonPlaying = '/lesson-playing';
  static const String audioBook = '/audio-book';
  static const String detailAudioBook = '/detail-audio-book';
  static const String profile = '/profile';
}

/// Router configuration for the application
class AppRouter {
  static final UserDataStoreRepository _authRepo =
      sl<UserDataStoreRepository>();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppPaths.login,
    redirect: (context, state) {
      final isLoginRoute = state.matchedLocation == AppPaths.login;
      final isOnboardingRoute = state.matchedLocation == AppPaths.onboarding;
      final hasSeenOnboarding = _authRepo.hasSeenOnboarding;

      // If the user hasn't seen onboarding and isn't on the onboarding route, go to onboarding
      if (!hasSeenOnboarding && !isOnboardingRoute) {
        return AppPaths.onboarding;
      }

      // If the user has seen onboarding but is trying to access onboarding again, redirect to login
      if (hasSeenOnboarding && isOnboardingRoute) {
        return AppPaths.login;
      }

      // If not logged in and not on login page, redirect to login
      if (!_authRepo.isAuthenticated && !isLoginRoute && !isOnboardingRoute) {
        return AppPaths.login;
      }

      // If logged in and on login page, redirect to home
      if (_authRepo.isAuthenticated && isLoginRoute) {
        return AppPaths.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppPaths.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      GoRoute(
        path: AppPaths.login,
        name: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppPaths.home,
        name: AppRoutes.home,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: AppPaths.courses,
        name: AppRoutes.courses,
        builder: (context, state) => const CoursesScreen(),
      ),
      GoRoute(
        path: '/courses/:id',
        name: AppRoutes.detailCourse,
        builder: (context, state) => DetailCourseScreen(
          courseId: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        path: '/lessons/:id',
        name: AppRoutes.lessonPlaying,
        builder: (context, state) => const LessonPlayingScreen(),
      ),
      GoRoute(
        path: AppPaths.audioBook,
        name: AppRoutes.audioBook,
        builder: (context, state) => const AudioBookScreen(),
      ),
      GoRoute(
        path: AppPaths.detailAudioBook,
        name: AppRoutes.detailAudioBook,
        builder: (context, state) => const DetailAudioBookScreen(),
      ),
      // GoRoute(
      //   path: AppPaths.profile,
      //   name: AppRoutes.profile,
      //   builder: (context, state) => const ProfileScreen(),
      // ),
    ],
  );
}
