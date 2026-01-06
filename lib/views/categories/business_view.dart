import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ozet_haber/constants/titles_const.dart';
import 'package:ozet_haber/models/news_model.dart';
import 'package:ozet_haber/services/categories/business_service.dart';
import 'package:ozet_haber/widgets/appbar_title.dart';
import 'package:ozet_haber/widgets/drawer_menu.dart';
import 'package:ozet_haber/widgets/common_view_body.dart';

@RoutePage()
class BusinessView extends StatefulWidget {
  const BusinessView({super.key});

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
  final BusinessService _businessService = BusinessService(); 
  late Future<List<NewsModel>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _articlesFuture = _businessService.fetchArticles(); 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(TitlesConst.businessViewTitle),
          centerTitle: true,
        ),
        drawer: DrawerMenu(),
        body: CommonViewBody(articlesFuture: _articlesFuture),
      ),
    );
  }
}