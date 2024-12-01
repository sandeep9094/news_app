// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_headline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopHeadline _$TopHeadlineFromJson(Map<String, dynamic> json) => TopHeadline(
      json['status'] as String,
      (json['totalResults'] as num).toInt(),
      (json['articles'] as List<dynamic>)
          .map((e) => TopHeadlineArticles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopHeadlineToJson(TopHeadline instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

TopHeadlineArticles _$TopHeadlineArticlesFromJson(Map<String, dynamic> json) =>
    TopHeadlineArticles(
      json['title'] as String? ?? '',
      json['description'] as String? ?? '',
      json['url'] as String? ?? '',
      json['urlToImage'] as String? ?? '',
      json['content'] as String? ?? '',
      TopHeadlineArticlesSource.fromJson(
          json['source'] as Map<String, dynamic>),
      json['author'] as String? ?? 'Author',
    );

Map<String, dynamic> _$TopHeadlineArticlesToJson(
        TopHeadlineArticles instance) =>
    <String, dynamic>{
      'source': instance.source,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
      'author': instance.author,
    };

TopHeadlineArticlesSource _$TopHeadlineArticlesSourceFromJson(
        Map<String, dynamic> json) =>
    TopHeadlineArticlesSource(
      json['id'],
      json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TopHeadlineArticlesSourceToJson(
        TopHeadlineArticlesSource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
