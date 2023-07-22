import '../../../domain/models/requests/random_opinions.request.dart';
import '../../../domain/models/responses/random_opinions_response.dart';
import '../../../domain/repositories/opinion/opinion_api_repository.dart';
import '../../../utils/resources/data_state.dart';
import '../../datasources/remote/opinion/opinion_service.dart';
import '../base/base_api_repository.dart';

class OpinionApiRepositoryImpl extends BaseApiRepository implements OpinionApiRepository {
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
