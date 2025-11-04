import 'package:auto_route/auto_route.dart';
import 'package:ozet_haber/views/home_view.dart';
import 'package:ozet_haber/views/turkiye_news_view.dart';
import 'package:ozet_haber/views/world_news_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: '/', initial: true),
    AutoRoute(page: TurkiyeNewsRoute.page),
    AutoRoute(page: WorldNewsRoute.page)
  ];
}