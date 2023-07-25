part of 'app_tokens_storage_service.dart';

class _AppTokensStorageService implements AppTokensStorageService {
  final SharedPreferences sharedPreferences;

  _AppTokensStorageService(this.sharedPreferences);

  @override
  JWTTokens? getAccessAndRefreshTokens() {
    final accessToken = this.getAccessToken();
    final refreshToken = this.getRefreshToken();

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    return JWTTokens(accessToken: accessToken, refreshToken: refreshToken);
  }

  @override
  String? getAccessToken() {
    return sharedPreferences.getString(accessTokenKey);
  }

  @override
  String? getRefreshToken() {
    return sharedPreferences.getString(refreshTokenKey);
  }

  @override
  Future<bool> removeAccessAndRefreshTokens() async {
    final accessTokenRemoved = await this.removeAccessToken();
    final refreshTokenRemoved = await this.removeRefreshToken();

    return accessTokenRemoved && refreshTokenRemoved;
  }

  @override
  Future<bool> removeAccessToken() async {
    return sharedPreferences.remove(accessTokenKey);
  }

  @override
  Future<bool> removeRefreshToken() async {
    return sharedPreferences.remove(refreshTokenKey);
  }

  @override
  Future<bool> saveAccessAndRefreshTokens(JWTTokens tokens) async {
    final accessTokenSaved = await this.saveAccessToken(tokens.accessToken);
    final refreshTokenSaved = await this.saveRefreshToken(tokens.refreshToken);

    return accessTokenSaved && refreshTokenSaved;
  }

  @override
  Future<bool> saveAccessToken(String accessToken) async {
    return sharedPreferences.setString(accessTokenKey, accessToken);
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken) async {
    return sharedPreferences.setString(refreshTokenKey, refreshToken);
  }
}
