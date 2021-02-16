import 'dart:convert';
import 'package:comento_pract/network/rest_api.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper._();
  static final NetworkHelper _networkHelper = NetworkHelper._();
  factory NetworkHelper(){
    return _networkHelper;
  }

  final baseURL = 'https://problem.comento.kr';
  final headers = {'Accept': 'application/json'};

  List<GetList> pageList = new List<GetList>();
  List<GetFilterCategory> filterCategoryList = new List<GetFilterCategory>();

  Future<List<GetFilterCategory>> fetchGetCategory() async {
    final response = await http.get(
      '$baseURL/api/category',
      headers: headers,
    );

    // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
    if (response.statusCode == 200) {
      // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
      var temp = GetCategory.fromJson(json.decode(response.body));
      for (var i = 0; i < temp.category.length; i++) {
        var tempPage = GetFilterCategory.fromJson(temp.category[i]);
        filterCategoryList.add(tempPage);
      }
      return filterCategoryList;
    } else {
      // 만약 요청이 실패하면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }

  Future<List<GetList>> fetchGetList(int page, int category) async {
    final response = await http.get(
      '$baseURL/api/list?page=$page&ord=asc&category[]=$category&limit=10',
      headers: headers,
    );

    if (response.statusCode == 200) {
      // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
      var temp = GetPage.fromJson(json.decode(response.body));
      for (var i = 0; i < temp.data.length; i++) {
        var tempPage = GetList.fromJson(temp.data[i]);
        pageList.add(tempPage);
      }
      return pageList;
    } else {
      // 만약 요청이 실패하면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }
}
