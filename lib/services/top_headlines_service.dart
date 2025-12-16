import 'package:dio/dio.dart';
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
        throw Exception(
            '${TextsConst.apiRequestFailed} ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('${TextsConst.networkConnectionError} ${e.message}');
    } catch (e) {
      throw Exception(TextsConst.aGeneralFetchError);
    }
  }
}