import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oktoast/oktoast.dart';

import 'src/config/router/app_router.dart';
import 'src/config/themes/app_theme.dart';
import 'src/domain/repositories/database_repository.dart';
import 'src/domain/repositories/opinion/opinion_api_repository.dart';
import 'src/domain/repositories/user/user_api_repository.dart';
import 'src/locator.dart';
import 'src/presentation/cubits/local_articles/local_articles_cubit.dart';
import 'src/presentation/cubits/remote_opinions/remote_opinions_cubit.dart';
import 'src/presentation/cubits/remote_user_information/remote_user_information_cubit.dart';
import 'src/utils/constants/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Prevent Rotation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await initializeDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalArticlesCubit(
            locator<DatabaseRepository>(),
          )..getAllSavedArticles(),
        ),
        BlocProvider(
          create: (context) => RemoteOpinionsCubit(
            locator<OpinionApiRepository>(),
          )..getRandomOpinions(),
        ),
        BlocProvider(
          create: (context) => RemoteUserInformationCubit(
            locator<UserApiRepository>(),
          ),
        ),
      ],
      child: OKToast(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: appTitle,
          theme: AppTheme.light,
        ),
      ),
    );
  }
}
