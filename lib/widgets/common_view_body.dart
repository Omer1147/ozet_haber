import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ozet_haber/constants/animations_const.dart';
import 'package:ozet_haber/constants/texts_const.dart';
import 'package:ozet_haber/models/news_model.dart';
import 'package:ozet_haber/widgets/news/news_image.dart';
import 'package:ozet_haber/widgets/text/large_text.dart';
import 'package:ozet_haber/widgets/news/news_source_text.dart';
import 'package:ozet_haber/widgets/news/news_title_text.dart';

class CommonViewBody extends StatelessWidget {
  const CommonViewBody({
    super.key,
    required Future<List<NewsModel>> articlesFuture,
  }) : _articlesFuture = articlesFuture;

  final Future<List<NewsModel>> _articlesFuture;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<List<NewsModel>>(
            future: _articlesFuture, 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Lottie.asset(
                  AnimationsConst.loading,
                  width: 300.w,
                  height: 300.w,
                  fit: BoxFit.contain,
                  )
                );
              }
            
              if (snapshot.hasError) {
                return Center(child: 
                  LargeText('${TextsConst.error} ${snapshot.error}')
                );
              }
            
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final List<NewsModel> articles = snapshot.data!;
                return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                      child: ListTile(
                        leading: article.urlToImage != null
                            ? NewsImage(article.urlToImage!)
                            : Icon(Icons.article, size: 70.w),
                        title: NewsTitleText(article.title),
                        subtitle: NewsSourceText(article.sourceName),
                      ),
                    );
                  },
                );
              }
            
              return Center(child: 
                LargeText(TextsConst.noNewsAvailable)
              );
            },
          ),
        ),
      ],
    );
  }
}