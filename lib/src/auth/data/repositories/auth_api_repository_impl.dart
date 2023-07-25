import '../../../common/data/repositories/base_api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../../domain/models/responses/jwt_tokens_response.dart';
import '../../domain/repositories/auth_api_repository.dart';
import '../datasources/remote/auth_service.dart';

class AuthApiRepositoryImpl extends BaseApiRepository
    implements AuthApiRepository {
  final AuthApiService _authApiService;

  AuthApiRepositoryImpl(this._authApiService);

  @override
  Future<DataState<JWTTokensResponse>> login({
    required String email,
    required String password,
  }) {
    return getStateOf<JWTTokensResponse>(
      request: () => _authApiService.login(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<DataState<JWTTokensResponse>> register({
    required String email,
    required String password,
    required String name,
    required int age,
  }) {
    return getStateOf<JWTTokensResponse>(
      request: () => _authApiService.register(
        email: email,
        password: password,
        name: name,
        age: age,
      ),
    );
  }

  @override
  Future<DataState<JWTTokensResponse>> refresh({
    required String refreshToken,
  }) {
    return getStateOf<JWTTokensResponse>(
      request: () => _authApiService.refresh(
        refreshToken: refreshToken,
      ),
    );
  }

  @override
  Future<void> logout() async {}
}
