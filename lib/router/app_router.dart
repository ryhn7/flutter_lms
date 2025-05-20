import 'package:go_router/go_router.dart';
import 'package:talent_insider/features/audio_book/presentation/screens/audio_book_screen.dart';
import 'package:talent_insider/features/audio_book/presentation/screens/detail_audio_book_screen.dart';
import 'package:talent_insider/features/courses/presentation/screens/courses_screen.dart';
import 'package:talent_insider/features/courses/presentation/screens/detail_course_screen.dart';
import 'package:talent_insider/features/courses/presentation/screens/lesson_playing_screen.dart';
import 'package:talent_insider/features/home/presentation/screen/home_screen.dart';
import 'package:talent_insider/features/authentication/presentation/screens/login_screen.dart';

/// Route names used in the application
class AppRoutes {
  static const String login = 'login';
  static const String home = 'home';
  static const String courses = 'courses';
  static const String detailCourse = 'detail-course';
  static const String lessonPlaying = 'lesson-playing';
  static const String audioBook = 'audio-book';
  static const String detailAudioBook = 'detail-audio-book';
  static const String profile = 'profile';
}

/// Route paths used in the application
class AppPaths {
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
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppPaths.login,
    routes: [
      GoRoute(
        path: AppPaths.login,
        name: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppPaths.home,
        name: AppRoutes.home,
        builder: (context, state) {
          // final user = state.extra as User?;

          // // Redirect to login if user is null
          // if (user == null) {
          //   return const LoginScreen();
          // }

          return const HomeScreen();
        },
      ),
      GoRoute(
        path: AppPaths.courses,
        name: AppRoutes.courses,
        builder: (context, state) => const CoursesScreen(),
      ),
      GoRoute(
        path: AppPaths.detailCourse,
        name: AppRoutes.detailCourse,
        builder: (context, state) => const DetailCourseScreen(),
      ),
      GoRoute(
        path: AppPaths.lessonPlaying,
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
