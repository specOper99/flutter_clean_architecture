// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:qarar/src/domain/models/classes/opinion/opinion.dart' as _i6;
import 'package:qarar/src/presentation/views/opinion_details_view.dart' as _i3;
import 'package:qarar/src/presentation/views/random_opinions_view.dart' as _i1;
import 'package:qarar/src/presentation/views/saved_articles_view.dart' as _i2;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    RandomOpinionView.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.RandomOpinionView(),
      );
    },
    SavedArticlesView.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SavedArticlesView(),
      );
    },
    OpinionDetailsView.name: (routeData) {
      final args = routeData.argsAs<OpinionDetailsViewArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.OpinionDetailsView(
          key: args.key,
          opinion: args.opinion,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.RandomOpinionView]
class RandomOpinionView extends _i4.PageRouteInfo<void> {
  const RandomOpinionView({List<_i4.PageRouteInfo>? children})
      : super(
          RandomOpinionView.name,
          initialChildren: children,
        );

  static const String name = 'RandomOpinionView';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SavedArticlesView]
class SavedArticlesView extends _i4.PageRouteInfo<void> {
  const SavedArticlesView({List<_i4.PageRouteInfo>? children})
      : super(
          SavedArticlesView.name,
          initialChildren: children,
        );

  static const String name = 'SavedArticlesView';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OpinionDetailsView]
class OpinionDetailsView extends _i4.PageRouteInfo<OpinionDetailsViewArgs> {
  OpinionDetailsView({
    _i5.Key? key,
    required _i6.Opinion opinion,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          OpinionDetailsView.name,
          args: OpinionDetailsViewArgs(
            key: key,
            opinion: opinion,
          ),
          initialChildren: children,
        );

  static const String name = 'OpinionDetailsView';

  static const _i4.PageInfo<OpinionDetailsViewArgs> page =
      _i4.PageInfo<OpinionDetailsViewArgs>(name);
}

class OpinionDetailsViewArgs {
  const OpinionDetailsViewArgs({
    this.key,
    required this.opinion,
  });

  final _i5.Key? key;

  final _i6.Opinion opinion;

  @override
  String toString() {
    return 'OpinionDetailsViewArgs{key: $key, opinion: $opinion}';
  }
}
