import '../models/classes/jwt_tokens.dart';

abstract class TokensRepository {
  JWTTokens? getAccessTokenAndRefreshToken();

  Future<bool> saveAccessTokenAndRefreshToken(
    JWTTokens tokens,
  );

  Future<bool> removeAccessTokenAndRefreshToken();

  String? getAccessToken();

  Future<bool> saveAccessToken(String accessToken);

  Future<bool> removeAccessToken();

  String? getRefreshToken();

  Future<bool> saveRefreshToken(String refreshToken);

  Future<bool> removeRefreshToken();
}
