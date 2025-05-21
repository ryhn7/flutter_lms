import 'package:talent_insider/core/common/result_state.dart';
import 'package:talent_insider/features/authentication/data/models/user.dart';
import 'package:talent_insider/features/authentication/data/remote/auth_api.dart';
import 'package:talent_insider/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:talent_insider/features/authentication/domain/repositories/user_data_store_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthApi _authApi;
  final UserDataStoreRepository _userDataStoreRepository;

  AuthenticationRepositoryImpl({
    required AuthApi authApi,
    required UserDataStoreRepository userDataStoreRepository,
  })  : _authApi = authApi,
        _userDataStoreRepository = userDataStoreRepository;

  @override
  Future<ResultState<User>> login(String email, String password) async {
    try {
      final response = await _authApi.login(email, password);
      final user = response.user;

      // Save user data to SharedPreferences
      await _userDataStoreRepository.saveUserAndToken(
        user,
        response.token,
      );

      return ResultState.success(user);
    } catch (e) {
      return ResultState.error(e.toString());
    }
  }

  @override
  Future<ResultState<void>> logout() async {
    try {
      await _userDataStoreRepository.clearAuth();
      return const ResultState.success(null);
    } catch (e) {
      return ResultState.error(e.toString());
    }
  }

  Future<User?> getCurrentUser() async {
    final user = _userDataStoreRepository.currentUser;
    if (user != null) {
      return user;
    }
    return null;
  }
}
