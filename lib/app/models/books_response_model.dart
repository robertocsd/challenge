// To parse this JSON data, do
//
//     final booksResponse = booksResponseFromMap(jsonString);

import 'dart:convert';

class BooksResponse {
  BooksResponse({
    required this.numFound,
    required this.start,
    required this.docs,
  });

  final int numFound;
  final int start;
  final List<Doc> docs;

  factory BooksResponse.fromJson(String str) =>
      BooksResponse.fromMap(json.decode(str));

  factory BooksResponse.fromMap(Map<String, dynamic> json) => BooksResponse(
        numFound: json["numFound"],
        start: json["start"],
        docs: json["docs"] == null
            ? []
            : List<Doc>.from(json["docs"].map((x) => Doc.fromMap(x))),
      );
}

class Doc {
  Doc({
    required this.key,
    required this.title,
    required this.coverI,
    required this.authorName,
  });

  final String key;
  final String title;
  final int coverI;
  final List<String> authorName;

  factory Doc.fromJson(String str) => Doc.fromMap(json.decode(str));

  factory Doc.fromMap(Map<String, dynamic> json) => Doc(
        key: json["key"],
        title: json["title"] ?? 'Sin titulo encontrado',
        coverI: json["cover_i"] ?? 0,
        authorName: json["author_name"] == null
            ? ['Sin autor encontrado']
            : List<String>.from(json["author_name"].map((x) => x)),
      );
}
