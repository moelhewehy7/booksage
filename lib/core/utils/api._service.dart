import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  final baseurl = "https://www.googleapis.com/books/v1/";

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    Response response = await dio.get("$baseurl$endpoint");
    return response.data;
  }
}
