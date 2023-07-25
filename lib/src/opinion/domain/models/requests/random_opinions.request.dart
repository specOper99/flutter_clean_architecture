import '../../../../utils/constants/numbers.dart';
import '../../../../utils/constants/strings.dart';

// TODO: Change this once you start using the official API
class RandomOpinionsRequest {
  final String apiKey;
  final String sources;
  final int page;
  final int pageSize;

  RandomOpinionsRequest({
    this.apiKey = defaultApiKey,
    this.sources = 'bbc-news, abc-news',
    this.page = 1,
    this.pageSize = defaultPageSize,
  });
}
