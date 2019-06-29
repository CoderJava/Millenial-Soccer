import 'package:millenial_soccer/src/model/news/news_response.dart';

import 'news_api_provider.dart';

class NewsApiRepository {
  final newsApiProvider = NewsApiProvider();

  Future<NewsResponse> getNews(String strDateFrom) => newsApiProvider.getNews(strDateFrom);
}