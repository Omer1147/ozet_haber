import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ozet_haber/constants/titles_const.dart';
import 'package:ozet_haber/models/news_model.dart';
import 'package:ozet_haber/services/categories/health_service.dart';
import 'package:ozet_haber/widgets/appbar_title.dart';
import 'package:ozet_haber/widgets/drawer_menu.dart';
import 'package:ozet_haber/widgets/common_view_body.dart';

@RoutePage()
class HealthView extends StatefulWidget {
  const HealthView({super.key});

  @override
  State<HealthView> createState() => _HealthViewState();
}

class _HealthViewState extends State<HealthView> {
  final HealthService _healthService = HealthService(); 
  late Future<List<NewsModel>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _articlesFuture = _healthService.fetchArticles(); 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(TitlesConst.healthViewTitle),
          centerTitle: true,
        ),
        drawer: DrawerMenu(),
        body: CommonViewBody(articlesFuture: _articlesFuture),
      ),
    );
  }
}