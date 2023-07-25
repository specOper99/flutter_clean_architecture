import '../../../common/data/repositories/base_api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../../domain/models/requests/user_information.request.dart';
import '../../domain/models/responses/user_information_response.dart';
import '../../domain/repositories/user_api_repository.dart';
import '../datasources/remote/user_service.dart';

class UserApiRepositoryImpl extends BaseApiRepository
    implements UserApiRepository {
  final UserApiService _userApiService;

  UserApiRepositoryImpl(this._userApiService);

  @override
  Future<DataState<UserInformationResponse>> getUserInformation({
    required UserInformationRequest request,
  }) {
    return getStateOf<UserInformationResponse>(
      request: () => _userApiService.getUserInformation(
        userID: request.userID,
      ),
    );
  }
}
