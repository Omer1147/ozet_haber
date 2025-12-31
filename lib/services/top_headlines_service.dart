import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ozet_haber/constants/texts_const.dart';
import 'package:ozet_haber/env/env.dart';
import '../models/news_model.dart';

class TopHeadlinesService {
  static const String _baseUrl = "https://newsapi.org/v2";
  static const String _endpoint = "/top-headlines";
  static final String _apiKey = Env.apiKey;

  final Dio _dio = Dio();

  Future<List<NewsModel>> fetchArticles() async {
    try {
      final response = await _dio.get(
        '$_baseUrl$_endpoint', 
        queryParameters: {
          'apiKey': _apiKey,
          'language': 'en',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> articlesJson = response.data['articles']; 
        return articlesJson
            .map((json) => NewsModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        if(kDebugMode){
          debugPrint('${TextsConst.apiRequestFailed} ${response.statusCode}');
        }
        throw TextsConst.apiRequestFailed;
      }
    } on DioException catch (e) {
      if(kDebugMode){
        debugPrint('${TextsConst.networkConnectionError} ${e.message}');
      }
      throw TextsConst.networkConnectionError;
    } catch (e) {
      if(kDebugMode){
        debugPrint(TextsConst.aGeneralFetchError);
      }
      throw TextsConst.aGeneralFetchError;
    }
  }
}