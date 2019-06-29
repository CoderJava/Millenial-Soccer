import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "totalResults")
  int totalResults;
  @JsonKey(name: "articles")
  List<ItemArticleNews> listArticles;

  NewsResponse({this.status, this.totalResults, this.listArticles});

  @override
  String toString() {
    return 'NewsResponse{status: $status, totalResults: $totalResults, listArticles: $listArticles}';
  }

  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson()=> _$NewsResponseToJson(this);

}

@JsonSerializable()
class ItemArticleNews {
  @JsonKey(name: "source")
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ItemArticleNews({this.source, this.author, this.title, this.description,
      this.url, this.urlToImage, this.publishedAt, this.content});

  @override
  String toString() {
    return 'ItemArticleNews{source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content}';
  }

  factory ItemArticleNews.fromJson(Map<String, dynamic> json) => _$ItemArticleNewsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemArticleNewsToJson(this);

}

@JsonSerializable()
class Source {
  String id;
  String name;

  Source({this.id, this.name});

  @override
  String toString() {
    return 'Source{id: $id, name: $name}';
  }

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

}
