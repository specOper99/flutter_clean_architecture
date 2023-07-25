import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oktoast/oktoast.dart';

import 'src/auth/domain/repositories/tokens_repository.dart';
import 'src/auth/presentation/cubits/local_tokens_cubit.dart';
import 'src/config/router/app_router.dart';
import 'src/config/themes/app_theme.dart';
import 'src/locator.dart';
import 'src/opinion/domain/repositories/opinion_api_repository.dart';
import 'src/opinion/presentation/cubits/remote_opinions_cubit.dart';
import 'src/user_information/domain/repositories/user_api_repository.dart';
import 'src/user_information/presentation/cubits/remote_user_information_cubit.dart';
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
          create: (context) => LocalTokensCubit(
            locator<TokensRepository>(),
          )..getAccessTokenAndRefreshToken(),
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
