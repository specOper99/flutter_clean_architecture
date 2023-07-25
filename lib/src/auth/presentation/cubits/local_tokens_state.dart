part of 'local_tokens_cubit.dart';

abstract class LocalTokensState extends Equatable {
  final String? accessToken;
  final String? refreshToken;

  const LocalTokensState({
    this.accessToken,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];
}

class LocalTokensLoading extends LocalTokensState {
  const LocalTokensLoading();
}

class LocalTokensSuccess extends LocalTokensState {
  const LocalTokensSuccess({
    super.accessToken,
    super.refreshToken,
  });
}

class LocalTokensLogout extends LocalTokensState {
  const LocalTokensLogout();
}
