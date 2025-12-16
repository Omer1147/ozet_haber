import 'package:ozet_haber/constants/texts_const.dart';

class NewsModel {
  final String sourceName;
  final String title;
  final String? urlToImage;

  NewsModel({
    required this.sourceName,
    required this.title,
    this.urlToImage,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic>? source = json['source'] as Map<String, dynamic>?;
    final String name = source?['name'] as String? ?? TextsConst.unknownSource;
    
    return NewsModel(
      sourceName: name, 
      title: json['title'] as String,
      urlToImage: json['urlToImage'] as String?,
    );
  }
}