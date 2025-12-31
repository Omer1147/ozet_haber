import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ozet_haber/constants/titles_const.dart';
import 'package:ozet_haber/models/news_model.dart';
import 'package:ozet_haber/services/top_headlines_service.dart';
import 'package:ozet_haber/widgets/appbar_title.dart';
import 'package:ozet_haber/widgets/drawer_menu.dart';
import 'package:ozet_haber/widgets/common_view_body.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TopHeadlinesService _topHeadlinesService = TopHeadlinesService(); 
  late Future<List<NewsModel>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _articlesFuture = _topHeadlinesService.fetchArticles(); 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(TitlesConst.homeViewTitle),
          centerTitle: true,
        ),
        drawer: DrawerMenu(),
        body: CommonViewBody(articlesFuture: _articlesFuture),
      ),
    );
  }
}