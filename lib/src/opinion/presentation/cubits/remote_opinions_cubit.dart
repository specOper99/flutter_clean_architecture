import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../common/presentation/cubits/base_cubit.dart';
import '../../../utils/constants/numbers.dart';
import '../../../utils/resources/data_state.dart';
import '../../domain/models/classes/opinion.dart';
import '../../domain/models/requests/random_opinions.request.dart';
import '../../domain/repositories/opinion_api_repository.dart';

part 'remote_opinions_state.dart';

class RemoteOpinionsCubit
    extends BaseCubit<RemoteOpinionsState, List<Opinion>> {
  final OpinionApiRepository _apiRepository;

  RemoteOpinionsCubit(this._apiRepository)
      : super(const RemoteOpinionsLoading(), []);

  int page = 1;

  Future<void> getRandomOpinions() async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getRandomOpinions(
        request: RandomOpinionsRequest(page: page),
      );

      if (response is DataSuccess) {
        final opinions = response.data!.opinions;
        final noMoreData = opinions.length < defaultPageSize;

        data.addAll(opinions);
        page++;

        emit(RemoteOpinionsSuccess(opinions: data, noMoreData: noMoreData));
      } else if (response is DataFailed) {
        emit(RemoteOpinionsFailed(error: response.error));
      }
    });
  }
}
