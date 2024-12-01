import 'package:json_annotation/json_annotation.dart';

part 'top_headline.g.dart';

@JsonSerializable()
class TopHeadline {
  String status;
  int totalResults;
  List<TopHeadlineArticles> articles;

  TopHeadline(this.status, this.totalResults, this.articles);

  factory TopHeadline.fromJson(Map<String, dynamic> json) => _$TopHeadlineFromJson(json);

  Map<String, dynamic> toJson() => _$TopHeadlineToJson(this);
}

@JsonSerializable()
class TopHeadlineArticles {
  TopHeadlineArticlesSource source;
  @JsonKey(defaultValue: "")
  String title;
  @JsonKey(defaultValue: "")
  String? description;
  @JsonKey(defaultValue: "")
  String url;
  @JsonKey(defaultValue: "")
  String urlToImage;
  @JsonKey(defaultValue: "")
  String content;
  @JsonKey(defaultValue: "Author")
  String author;

  TopHeadlineArticles(this.title, this.description, this.url, this.urlToImage, this.content, this.source, this.author);

  factory TopHeadlineArticles.fromJson(Map<String, dynamic> json) => _$TopHeadlineArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$TopHeadlineArticlesToJson(this);
}

@JsonSerializable()
class TopHeadlineArticlesSource {
  dynamic id;
  @JsonKey(defaultValue: "")
  String name;

  TopHeadlineArticlesSource(this.id, this.name);

  factory TopHeadlineArticlesSource.fromJson(Map<String, dynamic> json) => _$TopHeadlineArticlesSourceFromJson(json);

  Map<String, dynamic> toJson() => _$TopHeadlineArticlesSourceToJson(this);
}
