import 'package:talent_insider/core/network/api_config.dart';
import 'package:talent_insider/features/authentication/data/models/login_response_model.dart';

class AuthApi {
  final ApiConfig apiConfig;

  AuthApi({required this.apiConfig});

  Future<LoginResponseModel> login(String email, String password) async {
    try {
      final response = await apiConfig.postApi<LoginResponseModel>(
        '/auth/login',
        body: {
          'email': email,
          'password': password,
        },
        decoder: (json) => LoginResponseModel.fromJson(json),
      );

      return response;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
