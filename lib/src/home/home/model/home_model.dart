import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class AutoIndexResponseModel {
  ///
  @JsonProperty(name: 'code')
  int? code;

  ///
  @JsonProperty(name: 'msg')
  String? msg;

  ///
  @JsonProperty(name: 'newslist')
  List<AutoIndexModel>? newslist;
}

@jsonSerializable
class AutoIndexModel {
  ///
  @JsonProperty(name: 'id')
  String? id;

  ///
  @JsonProperty(name: 'ctime')
  String? ctime;

  ///
  @JsonProperty(name: 'title')
  String? title;

  ///
  @JsonProperty(name: 'description')
  String? description;

  ///
  @JsonProperty(name: 'source')
  String? source;

  ///
  @JsonProperty(name: 'picUrl')
  String? picUrl;

  ///
  @JsonProperty(name: 'url')
  String? url;
}


class Country {
  Country({
    required this.id,
    required this.country,
    required this.countryCode,
    required this.slug,
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    required this.date,
    required this.premium,
  });

  final String id;
  final String country;
  final String countryCode;
  final String slug;
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final DateTime date;
  final Premium premium;

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["ID"] as String,
    country: json["Country"] as String,
    countryCode: json["CountryCode"] as String,
    slug: json["Slug"] as String,
    newConfirmed: json["NewConfirmed"] as int,
    totalConfirmed: json["TotalConfirmed"] as int,
    newDeaths: json["NewDeaths"] as int,
    totalDeaths: json["TotalDeaths"] as int,
    newRecovered: json["NewRecovered"] as int,
    totalRecovered: json["TotalRecovered"] as int,
    date: DateTime.parse(json["Date"] as String),
    premium: Premium.fromJson(json["Premium"] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Country": country,
    "CountryCode": countryCode,
    "Slug": slug,
    "NewConfirmed": newConfirmed,
    "TotalConfirmed": totalConfirmed,
    "NewDeaths": newDeaths,
    "TotalDeaths": totalDeaths,
    "NewRecovered": newRecovered,
    "TotalRecovered": totalRecovered,
    "Date": date.toIso8601String(),
    "Premium": premium.toJson(),
  };
}

class Premium {
  Premium();

  factory Premium.fromRawJson(String str) => Premium.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Premium.fromJson(Map<String, dynamic> json) => Premium();

  Map<String, dynamic> toJson() => {};
}
