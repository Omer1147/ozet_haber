import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ozet_haber/constants/colors_const.dart';
import 'package:ozet_haber/constants/texts_const.dart';
import 'package:ozet_haber/models/news_model.dart';

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
                return const Center(child: CircularProgressIndicator());
              }
            
              if (snapshot.hasError) {
                return Center(child: Text('${TextsConst.error} ${snapshot.error}'));
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
                            ? Image.network(
                                article.urlToImage!,
                                width: 70.w,
                                height: 65.w,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.broken_image, size: 70.w),
                              )
                            : Icon(Icons.article, size: 70.w),
                        
                        title: Text(
                          article.title,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        
                        subtitle: Text(
                          article.sourceName, 
                          style: TextStyle(color: ColorsConst.lightGray),
                        ),
                      ),
                    );
                  },
                );
              }
            
              return Center(child: Text(TextsConst.noNewsAvailable));
            },
          ),
        ),
      ],
    );
  }
}