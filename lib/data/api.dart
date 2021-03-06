import 'dart:convert';

import 'package:flutter_kit_ver1/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final baseUrl =
      'https://pixabay.com/api/'; // 수정 될 필요가 없는 코드이기 때문에 final, const 로 할 거면 +static
  final key = '24806100-af9f83f3fdbb69c73da3e93f1';

  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(
        Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo&pretty=true'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // map 형태로 얻은 데이터는 Json 형태처럼 사용이 가능 해 진다.

    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  } //여기까지는 기능단계

}
