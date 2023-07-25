import '../../../common/data/repositories/base_api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../../domain/models/requests/random_opinions.request.dart';
import '../../domain/models/responses/random_opinions_response.dart';
import '../../domain/repositories/opinion_api_repository.dart';
import '../datasources/remote/opinion_service.dart';

class OpinionApiRepositoryImpl extends BaseApiRepository
    implements OpinionApiRepository {
  final OpinionApiService _opinionApiService;

  OpinionApiRepositoryImpl(this._opinionApiService);

  @override
  Future<DataState<RandomOpinionsResponse>> getRandomOpinions({
    required RandomOpinionsRequest request,
  }) {
    return getStateOf<RandomOpinionsResponse>(
      request: () => _opinionApiService.getRandomOpinions(
        apiKey: request.apiKey,
        sources: request.sources,
        page: request.page,
        pageSize: request.pageSize,
      ),
    );
  }
}
