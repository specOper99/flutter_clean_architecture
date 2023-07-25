import '../../../utils/resources/data_state.dart';
import '../models/responses/jwt_tokens_response.dart';

abstract class AuthApiRepository {
  Future<DataState<JWTTokensResponse>> login({
    required String email,
    required String password,
  });

  Future<DataState<JWTTokensResponse>> register({
    required String email,
    required String password,
    required String name,
    required int age,
  });

  Future<DataState<JWTTokensResponse>> refresh({
    required String refreshToken,
  });

  Future<void> logout();
}
