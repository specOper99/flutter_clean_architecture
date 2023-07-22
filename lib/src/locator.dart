import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/local/app_database.dart';
import 'data/datasources/remote/opinion/opinion_service.dart';
import 'data/datasources/remote/user/user_service.dart';
import 'data/repositories/database_repository_impl.dart';
import 'data/repositories/opinion/opinion_api_repository_impl.dart';
import 'data/repositories/user/user_api_repository_impl.dart';
import 'domain/repositories/database_repository.dart';
import 'domain/repositories/opinion/opinion_api_repository.dart';
import 'domain/repositories/user/user_api_repository.dart';
import 'utils/constants/strings.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  await dotenv.load();

  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<AppDatabase>(db);

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

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

  // Local Database Dependencies

  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(locator<AppDatabase>()),
  );
}
