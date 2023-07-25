import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../utils/constants/strings.dart';
import '../../../domain/models/responses/user_information_response.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  @GET('/user-information')
  Future<HttpResponse<UserInformationResponse>> getUserInformation({
    @Query("userID") String? userID,
  });
}
