import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ozet_haber/constants/titles_const.dart';
import 'package:ozet_haber/models/news_model.dart';
import 'package:ozet_haber/services/categories/sports_service.dart';
import 'package:ozet_haber/widgets/appbar_title.dart';
import 'package:ozet_haber/widgets/drawer_menu.dart';
import 'package:ozet_haber/widgets/common_view_body.dart';

@RoutePage()
class SportsView extends StatefulWidget {
  const SportsView({super.key});

  @override
  State<SportsView> createState() => _SportsViewState();
}

class _SportsViewState extends State<SportsView> {
  final SportsService _sportsService = SportsService(); 
  late Future<List<NewsModel>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _articlesFuture = _sportsService.fetchArticles(); 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(TitlesConst.sportsViewTitle),
          centerTitle: true,
        ),
        drawer: DrawerMenu(),
        body: CommonViewBody(articlesFuture: _articlesFuture),
      ),
    );
  }
}