import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/models/classes/jwt_tokens.dart';
import '../../domain/repositories/tokens_repository.dart';

part 'local_tokens_state.dart';

class LocalTokensCubit extends Cubit<LocalTokensState> {
  final TokensRepository _tokensRepository;

  LocalTokensCubit(this._tokensRepository) : super(const LocalTokensLoading());

  Future<void> getAccessTokenAndRefreshToken() async {
    final tokens = _tokensRepository.getAccessTokenAndRefreshToken();
    if (tokens != null) {
      emit(
        LocalTokensSuccess(
          accessToken: tokens.accessToken,
          refreshToken: tokens.refreshToken,
        ),
      );
    } else {
      emit(const LocalTokensLogout());
    }
  }

  Future<void> saveAccessTokenAndRefreshToken(
    JWTTokens tokens,
  ) async {
    final result = await _tokensRepository.saveAccessTokenAndRefreshToken(
      tokens,
    );
    if (result) {
      emit(
        LocalTokensSuccess(
          accessToken: tokens.accessToken,
          refreshToken: tokens.refreshToken,
        ),
      );
    }
  }

  Future<void> removeAccessTokenAndRefreshToken() async {
    final result = await _tokensRepository.removeAccessTokenAndRefreshToken();
    if (result) {
      emit(
        const LocalTokensLogout(),
      );
    }
  }
}
