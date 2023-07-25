import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../common/presentation/cubits/base_cubit.dart';
import '../../../utils/resources/data_state.dart';
import '../../domain/models/classes/user_information.dart';
import '../../domain/models/requests/user_information.request.dart';
import '../../domain/repositories/user_api_repository.dart';

part 'remote_user_information_state.dart';

class RemoteUserInformationCubit
    extends BaseCubit<RemoteUserInformationState, UserInformation?> {
  final UserApiRepository _apiRepository;

  RemoteUserInformationCubit(this._apiRepository)
      : super(const RemoteUserInformationLoading(), null);

  Future<void> getUserInformation({required String userID}) async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getUserInformation(
        request: UserInformationRequest(userID: userID),
      );

      if (response is DataSuccess) {
        final userInformation = response.data!.userInformation;

        emit(RemoteUserInformationSuccess(user: userInformation));
      } else if (response is DataFailed) {
        emit(RemoteUserInformationFailed(error: response.error));
      }
    });
  }
}
