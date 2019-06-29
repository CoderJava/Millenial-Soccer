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
