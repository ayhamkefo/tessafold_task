import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/cache_helper.dart';
import '../utils/constats.dart';
import 'urls.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio) {
    _dio.options.baseUrl = Urls.baseUrl;
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        request: true,
        compact: true,
        maxWidth: 10000));
  }

  Map<String, String> _headers() {
    return {
      'Authorization': "Bearer ${CacheHelper.getData(key: 'token')}",
      'Content-Type': 'application/json',
      "Accept": 'application/json',
      "Accept-Charset": "application/json",
      "Accept-Language": lang,
    };
  }

  Future<Response> get({required String endPoint}) {
    return _dio.get(endPoint, options: Options(headers: _headers()));
  }

  Future<Response> post({required String endPoint, required dynamic data}) {
    return _dio.post(endPoint,
        data: data, options: Options(headers: _headers()));
  }

  Future<Response> put({required String endPoint, required dynamic data}) {
    return _dio.put(endPoint,
        data: data, options: Options(headers: _headers()));
  }

  Future<Response> delete({required String endPoint}) {
    return _dio.delete(endPoint, options: Options(headers: _headers()));
  }
}
