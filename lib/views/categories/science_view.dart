import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ozet_haber/constants/titles_const.dart';
import 'package:ozet_haber/models/news_model.dart';
import 'package:ozet_haber/services/categories/science_service.dart';
import 'package:ozet_haber/widgets/appbar_title.dart';
import 'package:ozet_haber/widgets/drawer_menu.dart';
import 'package:ozet_haber/widgets/common_view_body.dart';

@RoutePage()
class ScienceView extends StatefulWidget {
  const ScienceView({super.key});

  @override
  State<ScienceView> createState() => _ScienceViewState();
}

class _ScienceViewState extends State<ScienceView> {
  final ScienceService _scienceService = ScienceService(); 
  late Future<List<NewsModel>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _articlesFuture = _scienceService.fetchArticles(); 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(TitlesConst.scienceViewTitle),
          centerTitle: true,
        ),
        drawer: DrawerMenu(),
        body: CommonViewBody(articlesFuture: _articlesFuture),
      ),
    );
  }
}