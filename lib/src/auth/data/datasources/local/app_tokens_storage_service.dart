import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/constants/strings.dart';
import '../../../domain/models/classes/jwt_tokens.dart';

part 'app_tokens_storage_service.g.dart';

abstract class AppTokensStorageService {
  factory AppTokensStorageService(SharedPreferences sharedPreferences) =
      _AppTokensStorageService;

  JWTTokens? getAccessAndRefreshTokens();
  Future<bool> saveAccessAndRefreshTokens(JWTTokens tokens);
  Future<bool> removeAccessAndRefreshTokens();
  String? getAccessToken();
  Future<bool> saveAccessToken(String accessToken);
  Future<bool> removeAccessToken();
  String? getRefreshToken();
  Future<bool> saveRefreshToken(String refreshToken);
  Future<bool> removeRefreshToken();
}
