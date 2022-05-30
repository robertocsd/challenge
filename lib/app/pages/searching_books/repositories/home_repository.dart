import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:to_study/app/models/books_response_model.dart';

class Repository {
  Future<BooksResponse> getShortURL(String url) async {
    try {
      //this _baseUrl could be setted in an environment variable
      String _baseUrl =
          'https://openlibrary.org/search.json?q=$url&_facet=false&_spellcheck_count=0&limit=10&fields=key,cover_i,title,subtitle,author_name,name&mode=everything';
      Response response = await Dio().get(_baseUrl);
      return BooksResponse.fromJson(json.encode(response.data));
    } catch (e) {
      throw Exception(e);
    }
  }
}
