/*
 * Created by YSN Studio on 7/5/19 1:36 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 6/29/19 9:34 AM
 */

import 'package:dio/dio.dart';
import 'package:millenial_soccer/src/model/news/news_response.dart';

class NewsApiProvider {
  Dio dio = Dio();
  final _baseUrl = "https://newsapi.org/v2";
  final _apiKey = "fc14ae62fff14511a901ad9537987354";

  Future<NewsResponse> getNews(String strDateFrom) async {
    String url = "$_baseUrl/everything?q=soccer&from=$strDateFrom&sortBy=publishedAt&apiKey=$_apiKey";
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return NewsResponse.fromJson(response.data);
    } else {
      throw Exception("Failed to get news");
    }
  }
}