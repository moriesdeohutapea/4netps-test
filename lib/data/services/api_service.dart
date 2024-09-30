import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

import '../models/base_response.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl;

  ApiService({required String baseUrl})
      : _baseUrl = baseUrl,
        _dio = Dio()..interceptors.add(ChuckerDioInterceptor());

  Future<T> get<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final fullPath = '$_baseUrl$path';
    final response = await _dio.get(fullPath);
    return _mapResponse<T>(response.data, fromJson);
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

  T _mapResponse<T>(dynamic data, T Function(Map<String, dynamic>) fromJson) {
    if (data is List) {
      throw Exception('Expected an object, but received a list');
    } else if (data is Map<String, dynamic>) {
      return fromJson(data);
    } else {
      throw Exception('Invalid data format');
    }
  }

  Future<List<T>> getList<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final fullPath = '$_baseUrl$path';
    final response = await _dio.get(fullPath);
    return _mapResponseToList<T>(response.data, fromJson);
  }

  List<T> _mapResponseToList<T>(dynamic data, T Function(Map<String, dynamic>) fromJson) {
    if (data is List) {
      return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
    } else if (data is Map<String, dynamic>) {
      final baseResponse = BaseResponse<List<T>>.fromJson(
        data,
        (json) => (json as List).map((e) => fromJson(e as Map<String, dynamic>)).toList(),
      );
      if (baseResponse.data != null) {
        return baseResponse.data!;
      } else {
        throw Exception('Invalid data format: Missing data or employees key');
      }
    } else {
      throw Exception('Invalid data format: ${data.runtimeType}');
    }
  }
}