import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/api_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;

  late String token;
  late Map<String, String> mainHeaders;
  ApiClient({
    required this.appBaseUrl,
    required this.sharedPreferences,
  }) {
    timeout = const Duration(seconds: 30);
    baseUrl = appBaseUrl;
    token = sharedPreferences.getString(ApiValues.token) ?? '';
    mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      final Response response = await get(
        uri,
        headers: headers ?? mainHeaders,
      );
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      final Response response = await post(
        uri,
        body,
        headers: headers ?? mainHeaders,
      );
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }

  void updateHeaders(String token) {
    mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
}
