part of 'remote_user_information_cubit.dart';

abstract class RemoteUserInformationState extends Equatable {
  final UserInformation? user;
  final DioException? error;

  const RemoteUserInformationState({
    this.user,
    this.error,
  });

  @override
  List<Object?> get props => [user, error];
}

class RemoteUserInformationLoading extends RemoteUserInformationState {
  const RemoteUserInformationLoading();
}

class RemoteUserInformationSuccess extends RemoteUserInformationState {
  const RemoteUserInformationSuccess({super.user});
}

class RemoteUserInformationFailed extends RemoteUserInformationState {
  const RemoteUserInformationFailed({super.error});
}
