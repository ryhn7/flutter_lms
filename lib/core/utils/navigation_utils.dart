import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talent_insider/router/app_router.dart';

/// Navigation utility functions to handle common navigation patterns
class NavigationUtils {
  /// Safely navigate back or fallback to a default route if can't pop
  static void safeBack(BuildContext context, {String? fallbackRoute}) {
    if (GoRouter.of(context).canPop()) {
      context.pop();
    } else {
      // If we can't go back, navigate to home or specified fallback
      context.go(fallbackRoute ?? AppPaths.home);
    }
  }

  // ----------------------
  // STACK-REPLACING NAVIGATION (go/goNamed)
  // Use these for main app sections (Home, Courses, etc.)
  // ----------------------

  /// Navigate to home screen (replaces navigation stack)
  static void goHome(BuildContext context) {
    context.goNamed(AppRoutes.home);
  }

  /// Navigate to courses screen (replaces navigation stack)
  static void goCourses(BuildContext context) {
    context.goNamed(AppRoutes.courses);
  }

  /// Navigate to audio book screen (replaces navigation stack)
  static void goAudioBook(BuildContext context) {
    context.goNamed(AppRoutes.audioBook);
  }

  // ----------------------
  // STACK-PRESERVING NAVIGATION (push/pushNamed)
  // Use these for detail screens when you want to keep back navigation
  // ----------------------

  /// Navigate to course detail screen (preserves back navigation)
  static void pushCourseDetail(BuildContext context, String courseId) {
    context.pushNamed(AppRoutes.detailCourse, pathParameters: {'id': courseId});
  }

  /// Navigate to lesson playing screen (preserves back navigation)
  static void pushLessonPlaying(BuildContext context, String lessonId) {
    context
        .pushNamed(AppRoutes.lessonPlaying, pathParameters: {'id': lessonId});
  }

  /// Navigate to audio book detail screen (preserves back navigation)
  static void pushAudioBookDetail(BuildContext context) {
    context.pushNamed(AppRoutes.detailAudioBook);
  }

  // ----------------------
  // HELPER METHODS
  // ----------------------

  /// Check if back navigation is possible
  static bool canGoBack(BuildContext context) {
    return GoRouter.of(context).canPop();
  }
}
