import 'package:dio/dio.dart';
import 'dart:io';

import '../utils/constats.dart';
import 'failuer.dart';

class ErrorHandler {
  static const Map<String, String> _enMessages = {
    "connectionTimeout": "Connection timeout with the server.",
    "sendTimeout": "Request timeout with the server.",
    "receiveTimeout": "The server is not responding.",
    "cancel": "Request was canceled.",
    "noInternet": "No internet connection.",
    "unknownError": "Unknown error occurred.",
    "badCertificate": "Bad certificate error.",
    "connectionError": "No internet connection.",
    "serverError": "Oops, there was an error. Please try again later.",
    "notFound": "The requested resource was not found.",
    "internalServerError": "Internal server error. Please try again later.",
    "validationError": "Invalid input data.",
    "error_tryAgain": "Oops there was an error, please try again later.",
  };

  static const Map<String, String> _arMessages = {
    "connectionTimeout": "انتهت مهلة الاتصال بالخادم",
    "sendTimeout": "انتهت مهلة الطلب للخادم",
    "receiveTimeout": "الخادم لا يستجيب",
    "cancel": "تم إلغاء الطلب",
    "noInternet": "لا يوجد اتصال بالإنترنت",
    "unknownError": "حدث خطأ غير معروف",
    "badCertificate": "خطأ في الشهادة",
    "connectionError": "لا يوجد اتصال بالإنترنت",
    "serverError": "هنالك خطأ ما، الرجاء المحاولة لاحقاً",
    "notFound": "الطلب غير موجود",
    "internalServerError": "خطأ في الخادم، الرجاء المحاولة لاحقاً",
    "validationError": "بيانات غير صالحة",
    "error_tryAgain": "هنالك خطأ ما الرجاء المحاولة لاحقاً",
  };
  static Map<String, String> get _messages =>
      lang == 'en' ? _enMessages : _arMessages;
  static String defaultMessage() => _messages['error_tryAgain']!;

  static Failure handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    }
    if (error is SocketException) {
      return NetworkFailure(_messages['noInternet']!);
    }
    return UnknownFailure(_messages['error_tryAgain']!);
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure(_messages['connectionTimeout']!);
      case DioExceptionType.sendTimeout:
        return NetworkFailure(_messages['sendTimeout']!);
      case DioExceptionType.receiveTimeout:
        return NetworkFailure(_messages['receiveTimeout']!);
      case DioExceptionType.cancel:
        return NetworkFailure(_messages['cancel']!);
      case DioExceptionType.unknown:
        return error.error is SocketException
            ? NetworkFailure(_messages['noInternet']!)
            : UnknownFailure(_messages['unknownError']!);
      case DioExceptionType.badCertificate:
        return NetworkFailure(_messages['badCertificate']!);
      case DioExceptionType.connectionError:
        return NetworkFailure(_messages['connectionError']!);
      case DioExceptionType.badResponse:
        return _handleResponseError(error);
      default:
        return ServerFailure(_messages['error_tryAgain']!);
    }
  }

  static Failure _handleResponseError(DioException error) {
    final response = error.response;
    if (response == null) return ServerFailure(_messages['serverError']!);
    switch (response.statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(
            response.data['message'] ?? _messages['error_tryAgain']!);
      case 404:
        return ServerFailure(_messages['notFound']!);
      case 422:
        return ValidationFailure(_handleValidationErrors(response.data));
      case 500:
        return ServerFailure(
            response.data['message'] ?? _messages['internalServerError']!);
      case 503:
        return ServerFailure(
            response.data['message'] ?? _messages['serverError']!);
      default:
        return ServerFailure(_messages['serverError']!);
    }
  }

  static String _handleValidationErrors(dynamic data) {
    final errors = (data is Map<String, dynamic>) ? data['message'] : null;
    if (errors is! Map<String, dynamic>) {
      return _messages['validationError']!;
    }

    final messages = errors.values.expand((e) {
      if (e is List) return e.map((v) => v.toString());
      return [e.toString()];
    }).join(', ');

    return messages.isNotEmpty ? messages : _messages['validationError']!;
  }
}
