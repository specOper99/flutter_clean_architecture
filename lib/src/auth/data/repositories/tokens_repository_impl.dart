import '../../domain/models/classes/jwt_tokens.dart';
import '../../domain/repositories/tokens_repository.dart';
import '../datasources/local/app_tokens_storage_service.dart';

class TokensRepositoryImpl implements TokensRepository {
  final AppTokensStorageService _appDatabase;

  TokensRepositoryImpl(this._appDatabase);

  @override
  JWTTokens? getAccessTokenAndRefreshToken() {
    return _appDatabase.getAccessAndRefreshTokens();
  }

  @override
  Future<bool> saveAccessTokenAndRefreshToken(
    JWTTokens tokens,
  ) async {
    return await _appDatabase.saveAccessAndRefreshTokens(tokens);
  }

  @override
  Future<bool> removeAccessTokenAndRefreshToken() async {
    return await _appDatabase.removeAccessAndRefreshTokens();
  }

  @override
  String? getAccessToken() {
    return _appDatabase.getAccessToken();
  }

  @override
  Future<bool> saveAccessToken(String accessToken) async {
    return await _appDatabase.saveAccessToken(accessToken);
  }

  @override
  Future<bool> removeAccessToken() async {
    return await _appDatabase.removeAccessToken();
  }

  @override
  String? getRefreshToken() {
    return _appDatabase.getRefreshToken();
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken) async {
    return await _appDatabase.saveRefreshToken(refreshToken);
  }

  @override
  Future<bool> removeRefreshToken() async {
    return await _appDatabase.removeRefreshToken();
  }
}
