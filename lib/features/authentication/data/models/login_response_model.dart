import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:talent_insider/features/authentication/data/models/user.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {

  factory LoginResponseModel({
    required String expiresOn,
    required String token,
    required User user,
    required String userId,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}