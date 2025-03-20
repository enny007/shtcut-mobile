import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shtcut_mobile/app/app.locator.dart';
import 'package:shtcut_mobile/core/base/logger_mixin.dart';
import 'package:shtcut_mobile/core/models.dart/meta.dart';
import 'package:shtcut_mobile/core/network/exceptions.dart';
import 'package:shtcut_mobile/core/service/local_storage_service.dart';
import 'package:shtcut_mobile/core/utils/endpoints.dart';

class DioClient with LoggerMixin {
  final Dio _dio;
  final _localStorage = locator<SharedPreferencesService>();

  static DioClient? _instance;

  final Map<String, dynamic> baseHeaders = {
    'Content-Type': 'application/json',
    "Accept": "*/*",
    'x-api-key': Endpoints.xKey,
  };

  static DioClient getInstance() {
    _instance ??= DioClient._(Dio());
    return _instance!;
  }

  DioClient._(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout =
          const Duration(milliseconds: Endpoints.connectionTimeOut)
      ..options.receiveTimeout =
          const Duration(milliseconds: Endpoints.responseTimeOut)
      ..options.responseType = ResponseType.json
      ..options.headers = baseHeaders
      ..options.validateStatus = (statusCode) {
        if (statusCode == null) {
          return false;
        }
        if (statusCode == 411) {
          // locator<AuthService>().refreshToken();
          return false;
        }
        if (kDebugMode) return true;
        if (statusCode == 311 || statusCode == 511) return true;
        if (statusCode >= 400 && statusCode < 500) {
          // your http status code
          return true;
        } else {
          return statusCode >= 200 && statusCode < 300;
        }
      }
      ..interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: !kReleaseMode,
        responseHeader: true,
        responseBody: !kReleaseMode,
        error: false,
      ))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _localStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
            logger.d('Using active token: $token');
          }

          return handler.next(options);
        },
      ));

    // . .interceptors.add(FormDataInterceptor());
  }

  Future<bool> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.first != ConnectivityResult.none;
  }

  Future<Map<String, dynamic>> _handleRequest(
      Future<Response> Function() requestFunc) async {
    try {
      if (!await _checkConnectivity()) {
        throw InternetConnectionException();
      }
      final response = await requestFunc();
      return _parseResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException(e.toString());
    }
  }

  Map<String, dynamic> _parseResponse(Response response) {
    var responseData = response.data;
    if (responseData is String) {
      return jsonDecode(responseData) as Map<String, dynamic>;
    }
    return responseData as Map<String, dynamic>;
  }

  Exception _handleDioError(DioException error) {
    if (error.response?.data != null) {
      try {
        final errorData = error.response?.data;
        if (errorData is Map<String, dynamic> &&
            errorData.containsKey('meta')) {
          final meta = Meta.fromJson(errorData['meta'] as Map<String, dynamic>);
          return ApiException(meta.effectiveErrorMessage,
              title: meta.error?.message ?? "Error");
        }
      } catch (e) {
        logger.e("Error parsing response: $e");
      }
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException();
      case DioExceptionType.cancel:
        return RequestCancelledException();
      default:
        if (error.response?.data is Map<String, dynamic>) {
          final errorData = error.response?.data as Map<String, dynamic>;
          return ApiException(
              errorData['message'] ?? "An unknown error occurred");
        }
        return ApiException(error.message ?? "An unknown error occurred");
    }
  }

  // Get:------------------------------------------------------
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _handleRequest(() => _dio.get(
          url,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        ));
  }

  // GetList:------------------------------------------------------
  Future<List<dynamic>> getList(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      if (!await _checkConnectivity()) {
        throw InternetConnectionException();
      }
      final response = await _dio.get(
        url,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data as List<dynamic>;
    } catch (e) {
      if (e is DioException) {
        throw _handleDioError(e);
      }
      throw ApiException(e.toString());
    }
  }

  // Post:------------------------------------------------------
  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _handleRequest(() => _dio.post(
          url,
          data: data,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ));
  }

  // Patch:------------------------------------------------------
  Future<Map<String, dynamic>> patch(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _handleRequest(() => _dio.patch(
          url,
          data: data ?? formData,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ));
  }

  // Put:------------------------------------------------------
  Future<Map<String, dynamic>> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _handleRequest(() => _dio.put(
          url,
          data: data ?? formData,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ));
  }

  // Delete:------------------------------------------------------
  Future<Map<String, dynamic>> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _handleRequest(() => _dio.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        ));
  }

  // Add this method to the DioClient class
  Future<Map<String, dynamic>> postFormData(
    String url, {
    Map<String, dynamic>? params,
    FormData? formData,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _handleRequest(() => _dio.post(
          url,
          data: formData,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        ));
  }
}
