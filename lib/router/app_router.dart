import 'package:auto_route/auto_route.dart';
import 'package:ozet_haber/views/home_view.dart';
import 'package:ozet_haber/views/settings_view.dart';
import 'package:ozet_haber/views/categories/business_view.dart';
import 'package:ozet_haber/views/categories/entertainment_view.dart';
import 'package:ozet_haber/views/categories/health_view.dart';
import 'package:ozet_haber/views/categories/science_view.dart';
import 'package:ozet_haber/views/categories/sports_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: '/', initial: true),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: BusinessRoute.page),
    AutoRoute(page: EntertainmentRoute.page),
    AutoRoute(page: HealthRoute.page),
    AutoRoute(page: ScienceRoute.page),
    AutoRoute(page: SportsRoute.page),
  ];
}