import '../../../utils/resources/data_state.dart';
import '../models/requests/user_information.request.dart';
import '../models/responses/user_information_response.dart';

abstract class UserApiRepository {
  Future<DataState<UserInformationResponse>> getUserInformation({
    required UserInformationRequest request,
  });
}
