import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ozet_haber/constants/titles.dart';
import 'package:ozet_haber/widgets/custom_title.dart';
import 'package:ozet_haber/widgets/turkiye_news_row.dart';
import 'package:ozet_haber/widgets/world_news_row.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Center(child: CustomTitle(TitlesConst.homePageTitle))),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(children: [CustomTitle(TitlesConst.turkiyeTitle)]),

                    TurkiyeNewsRow(),

                    Row(children: [CustomTitle(TitlesConst.worldTitle)]),

                    WorldNewsRow(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}