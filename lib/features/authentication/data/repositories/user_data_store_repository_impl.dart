import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talent_insider/features/authentication/data/models/user.dart';
import 'package:talent_insider/features/authentication/domain/repositories/user_data_store_repository.dart';

class UserDataStoreRepositoryImpl implements UserDataStoreRepository {
  final SharedPreferences _prefs;
  static const String _userKey = 'user_data';
  static const String _tokenKey = 'token';
  static const String _onboardingKey = 'seen_onboarding';

  UserDataStoreRepositoryImpl(this._prefs);

  @override
  User? get currentUser {
    final userStr = _prefs.getString(_userKey);
    if (userStr == null) return null;
    return User.fromJson(jsonDecode(userStr));
  }

  @override
  String? get token => _prefs.getString(_tokenKey);

  @override
  bool get isAuthenticated => token != null && currentUser != null;

  @override
  bool get hasSeenOnboarding => _prefs.getBool(_onboardingKey) ?? false;

  @override
  Future<void> saveUserAndToken(User user, String token) async {
    await _prefs.setString(_userKey, jsonEncode(user.toJson()));
    await _prefs.setString(_tokenKey, token);
  }

  @override
  Future<void> clearAuth() async {
    await _prefs.remove(_userKey);
    await _prefs.remove(_tokenKey);
  }

  @override
  Future<void> setSeenOnboarding(bool value) async {
    await _prefs.setBool(_onboardingKey, value);
  }
}
