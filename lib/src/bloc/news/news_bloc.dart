/*
 * Created by YSN Studio on 7/5/19 1:36 PM
 * Copyright (c) 2019. All right reserved.
 * Last modified 6/29/19 9:36 AM
 */

import 'package:millenial_soccer/src/model/news/news_response.dart';
import 'package:millenial_soccer/src/resources/news/news_api_repository.dart';

class NewsBloc {
  final _newsApiRepository = NewsApiRepository();

  dispose() {
    // TODO: do soemthing in here
  }

  Future<NewsResponse> getNews(String strDateFrom) async {
    return await _newsApiRepository.getNews(strDateFrom);
  }
}
