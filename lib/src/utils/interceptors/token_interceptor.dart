import 'package:dio/dio.dart';

import '../../auth/domain/repositories/auth_api_repository.dart';
import '../../auth/domain/repositories/tokens_repository.dart';
import '../helpers/is_jwt_token_expired.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor(
      {required this.tokensRepository, required this.authApiRepository});

  // final Dio _dio = Dio();
  final TokensRepository tokensRepository;
  final AuthApiRepository authApiRepository;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final tokens = tokensRepository.getAccessTokenAndRefreshToken();
    if (tokens != null) {
      if (isJwtTokenExpired(tokens.accessToken)) {
        final newTokens =
            (await authApiRepository.refresh(refreshToken: tokens.refreshToken))
                .data;
        if (newTokens == null) {
          return handler.reject(
            DioException(
                requestOptions: options, error: "Refresh token failed"),
          );
        }
        tokensRepository.saveAccessToken(newTokens.accessToken);
        tokensRepository.saveRefreshToken(newTokens.refreshToken);
        options.headers["Authorization"] = "Bearer ${newTokens.accessToken}";
      } else {
        options.headers["Authorization"] = "Bearer ${tokens.accessToken}";
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // final refreshToken = tokensRepository.getRefreshToken();
      // if (refreshToken == null) {
        authApiRepository.logout();
        tokensRepository.removeAccessTokenAndRefreshToken();
        return super.onError(err, handler);
      }
    //   final newTokens =
    //       (await authApiRepository.refresh(refreshToken: refreshToken)).data;
    //   if (newTokens == null) {
    //     authApiRepository.logout();
    //     tokensRepository.removeAccessTokenAndRefreshToken();
    //     return super.onError(err, handler);
    //   }
    //   tokensRepository.saveAccessToken(newTokens.accessToken);
    //   tokensRepository.saveRefreshToken(newTokens.refreshToken);
    //   handler.resolve(
    //     await _dio.request(
    //       err.requestOptions.path,
    //       options: err.requestOptions)
    //   );
    // }
    // super.onError(err, handler);
  }
}
