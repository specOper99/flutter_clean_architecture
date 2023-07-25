import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../utils/constants/strings.dart';
import '../../../domain/models/responses/random_opinions_response.dart';

part 'opinion_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class OpinionApiService {
  factory OpinionApiService(Dio dio, {String baseUrl}) = _OpinionApiService;

  @GET('/top-headlines')
  Future<HttpResponse<RandomOpinionsResponse>> getRandomOpinions({
    @Query("apiKey") String? apiKey,
    @Query("sources") String? sources,
    @Query("page") int? page,
    @Query("pageSize") int? pageSize,
  });
}
