import 'package:dio/dio.dart';
import 'package:to_study/app/models/short_response_model.dart';

class Repository {
  Future<ShortResponse> getShortURL(String url) async {
    try {
      //this _baseUrl could be setted in an environment variable
      String _baseUrl = 'https://url-shortener-nu.herokuapp.com/api/alias';
      Response response = await Dio().post(_baseUrl, data: {"url": url});
      return ShortResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
