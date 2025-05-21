import 'package:talent_insider/features/authentication/data/models/user.dart';

abstract class UserDataStoreRepository {
  User? get currentUser;
  String? get token;
  bool get isAuthenticated;

  Future<void> saveUserAndToken(User user, String token);
  Future<void> clearAuth();
  Future<void> setSeenOnboarding(bool value);
}
