/*
 * Created by YSN Studio on 7/5/19 1:36 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 6/29/19 7:17 PM
 */

import 'package:millenial_soccer/src/model/news/news_response.dart';

import 'news_api_provider.dart';

class NewsApiRepository {
  final _newsApiProvider = NewsApiProvider();

  Future<NewsResponse> getNews(String strDateFrom) => _newsApiProvider.getNews(strDateFrom);
}