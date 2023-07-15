import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BreakingNewsView.page, initial: true),
        AutoRoute(page: ArticleDetailsView.page),
        AutoRoute(page: SavedArticlesView.page),
      ];
}

final appRouter = AppRouter();