import 'package:json_annotation/json_annotation.dart';

part 'search_responce.g.dart';

@JsonSerializable()
class SearchResponce {
  @JsonKey(name: 'results')
  List<SearchResultData>? results;
  SearchResponce({
    this.results = const[]
  });

  factory SearchResponce.fromJson(Map<String, dynamic> json) {
    return _$SearchResponceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponceToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  SearchResultData({
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
