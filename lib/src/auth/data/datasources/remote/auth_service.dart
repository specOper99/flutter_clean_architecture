import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../utils/constants/strings.dart';
import '../../../domain/models/responses/jwt_tokens_response.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: baseUrl, parser: Parser.MapSerializable)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/auth/login')
  Future<HttpResponse<JWTTokensResponse>> login({
    @Field("email") required String email,
    @Field("password") required String password,
  });

  @POST('/auth/register')
  Future<HttpResponse<JWTTokensResponse>> register({
    @Field("email") required String email,
    @Field("password") required String password,
    @Field("name") required String name,
    @Field("age") required int age,
  });

  @POST('/auth/refresh')
  Future<HttpResponse<JWTTokensResponse>> refresh({
    @Field("refreshToken") required String refreshToken,
  });
}
