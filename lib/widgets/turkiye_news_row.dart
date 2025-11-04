import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ozet_haber/constants/button_texts.dart';
import 'package:ozet_haber/constants/default_images.dart';
import 'package:ozet_haber/constants/news_list.dart';
import 'package:ozet_haber/router/app_router.dart';
import 'package:ozet_haber/widgets/news_title.dart';
import 'package:ozet_haber/widgets/small_container.dart';
import 'package:ozet_haber/widgets/small_sized_box.dart';

class TurkiyeNewsRow extends StatelessWidget {
  const TurkiyeNewsRow({
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
                            SmallContainer(ImagesConst.turkiyePng),
                            NewsTitle(NewsListConst.turkiyeNewsList[i]),
                          ],
                        ),
                      ),
                    ],
                  ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.router.push(TurkiyeNewsRoute());
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