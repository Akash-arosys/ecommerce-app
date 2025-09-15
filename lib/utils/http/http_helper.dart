import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/utils/exceptions/exceptions.dart';

class THttpHelper {
  static const String _baseUrl =
      'https://cricoscorer-backend.onrender.com/api/v1'; //Replace it with the orginal one

  static Future<Map<String, String>> getHeaders() async {
    final token = GetStorage().read(
      'token',
    ); // Make sure to import and initialize GetStorage
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? params,
  }) async {
    final headers = await getHeaders();

    final uri = Uri.parse(
      '$_baseUrl/$endpoint',
    ).replace(queryParameters: params);

    final response = await http.get(uri, headers: headers);
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(
    String endpoint,
    dynamic data,
  ) async {
    final headers = await getHeaders();
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: headers,
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> patch(
    String endpoint,
    dynamic data,
  ) async {
    final headers = await getHeaders();
    final response = await http.patch(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: headers,
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> delete(
    String endpoint, {
    Map<String, String>? params,
  }) async {
    final headers = await getHeaders();

    final uri = Uri.parse(
      '$_baseUrl/$endpoint',
    ).replace(queryParameters: params);

    final response = await http.delete(uri, headers: headers);
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    final jsonBody = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonBody;
    } else {
      throw TExceptions(
        jsonBody['message'] ?? 'unexpected-error',
        response.statusCode,
      );
    }
  }
}
