import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl;

  ApiService({required String baseUrl})
      : _baseUrl = baseUrl,
        _dio = Dio()..interceptors.add(ChuckerDioInterceptor());

  Future<List<T>> get<T>({
    required String path,
    required String listKey,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final fullPath = '$_baseUrl$path';
    final response = await _dio.get(fullPath);
    return _mapResponseToList(response.data, listKey, fromJson);
  }

  Future<T> post<T>({
    required String path,
    required Map<String, dynamic> data,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final fullPath = '$_baseUrl$path';
    final response = await _dio.post(fullPath, data: data);
    return fromJson(response.data as Map<String, dynamic>);
  }

  List<T> _mapResponseToList<T>(Map<String, dynamic> data, String listKey, T Function(Map<String, dynamic>) fromJson) {
    if (data.containsKey(listKey) && data[listKey] is List) {
      return (data[listKey] as List).map((e) => fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Invalid data format: Missing or invalid "$listKey" key');
    }
  }
}
