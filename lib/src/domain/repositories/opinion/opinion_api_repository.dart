import '../../../utils/resources/data_state.dart';
import '../../models/requests/random_opinions.request.dart';
import '../../models/responses/random_opinions_response.dart';

abstract class OpinionApiRepository {
  Future<DataState<RandomOpinionsResponse>> getRandomOpinions({
    required RandomOpinionsRequest request,
  });
}
