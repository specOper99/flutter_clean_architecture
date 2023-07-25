import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

//
import 'auth/data/datasources/local/app_tokens_storage_service.dart';
import 'auth/data/datasources/remote/auth_service.dart';
import 'auth/data/repositories/auth_api_repository_impl.dart';
import 'auth/data/repositories/tokens_repository_impl.dart';
import 'auth/domain/repositories/auth_api_repository.dart';
import 'auth/domain/repositories/tokens_repository.dart';
//
import 'opinion/data/datasources/remote/opinion_service.dart';
import 'opinion/data/repositories/opinion_api_repository_impl.dart';
import 'opinion/domain/repositories/opinion_api_repository.dart';
//
import 'user_information/data/datasources/remote/user_service.dart';
import 'user_information/data/repositories/user_api_repository_impl.dart';
import 'user_information/domain/repositories/user_api_repository.dart';
import 'utils/interceptors/token_interceptor.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  await dotenv.load();

  final dio = Dio();

  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  // Opinion API Dependencies
  locator.registerSingleton<OpinionApiService>(
    OpinionApiService(locator<Dio>()),
  );
  locator.registerSingleton<OpinionApiRepository>(
    OpinionApiRepositoryImpl(locator<OpinionApiService>()),
  );

  // User API Dependencies
  locator.registerSingleton<UserApiService>(
    UserApiService(locator<Dio>()),
  );
  locator.registerSingleton<UserApiRepository>(
    UserApiRepositoryImpl(locator<UserApiService>()),
  );

  // Auth API Dependencies
  locator.registerSingleton<AuthApiService>(
    AuthApiService(locator<Dio>()),
  );
  locator.registerSingleton<AuthApiRepository>(
    AuthApiRepositoryImpl(locator<AuthApiService>()),
  );

  // Local Database Dependencies
  locator.registerSingleton<AppTokensStorageService>(
    AppTokensStorageService(locator<SharedPreferences>()),
  );

  locator.registerSingleton<TokensRepository>(
    TokensRepositoryImpl(locator<AppTokensStorageService>()),
  );

  dio.interceptors.addAll([
    AwesomeDioInterceptor(),
    TokenInterceptor(
      tokensRepository: locator<TokensRepository>(),
      authApiRepository: locator<AuthApiRepository>(),
    ),
  ]);
}
