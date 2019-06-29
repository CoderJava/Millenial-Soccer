// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) {
  return NewsResponse(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      listArticles: (json['articles'] as List)
          ?.map((e) => e == null
              ? null
              : ItemArticleNews.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.listArticles
    };

ItemArticleNews _$ItemArticleNewsFromJson(Map<String, dynamic> json) {
  return ItemArticleNews(
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String);
}

Map<String, dynamic> _$ItemArticleNewsToJson(ItemArticleNews instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content
    };

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(id: json['id'] as String, name: json['name'] as String);
}

Map<String, dynamic> _$SourceToJson(Source instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
