import 'package:meta/meta.dart';
import 'dart:convert';

class ShortResponse {
  ShortResponse({
    @required this.alias,
    @required this.links,
  });

  final String? alias;
  final Links? links;
  factory ShortResponse.fromJson(Map<String, dynamic> json) => ShortResponse(
        alias: json["alias"],
        links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
      );

  Map<String, dynamic> toMap() => {
        "alias": alias,
        "_links": links == null ? null : links!.toMap(),
      };
}

class Links {
  Links({
    @required this.self,
    @required this.short,
  });

  final String? self;
  final String? short;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: json["self"],
        short: json["short"],
      );

  Map<String, dynamic> toMap() => {
        "self": self,
        "short": short,
      };
}
