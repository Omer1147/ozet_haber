import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ozet_haber/constants/button_texts.dart';
import 'package:ozet_haber/constants/default_images.dart';
import 'package:ozet_haber/constants/news_list.dart';
import 'package:ozet_haber/router/app_router.dart';
import 'package:ozet_haber/widgets/news_title.dart';
import 'package:ozet_haber/widgets/small_container.dart';
import 'package:ozet_haber/widgets/small_sized_box.dart';

class WorldNewsRow extends StatelessWidget {
  const WorldNewsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var i = 0; i < 3; i++)
                  Column(
                    children: [
                      SmallSizedBox(
                        Column(
                          children: [
                            SmallContainer(ImagesConst.worldPng),
                            NewsTitle(NewsListConst.worldNewsList[i]),
                          ],
                        ),
                      ),
                    ],
                  ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.router.push(WorldNewsRoute());
                      },
                      child: Text(ButtonTextConst.btnMore),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}