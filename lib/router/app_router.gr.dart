// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [TurkiyeNewsView]
class TurkiyeNewsRoute extends PageRouteInfo<void> {
  const TurkiyeNewsRoute({List<PageRouteInfo>? children})
    : super(TurkiyeNewsRoute.name, initialChildren: children);

  static const String name = 'TurkiyeNewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TurkiyeNewsView();
    },
  );
}

/// generated route for
/// [WorldNewsView]
class WorldNewsRoute extends PageRouteInfo<void> {
  const WorldNewsRoute({List<PageRouteInfo>? children})
    : super(WorldNewsRoute.name, initialChildren: children);

  static const String name = 'WorldNewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WorldNewsView();
    },
  );
}
