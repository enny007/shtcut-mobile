import 'package:dio/dio.dart';
import 'package:shtcut_mobile/core/base/base_data.dart';
import 'package:shtcut_mobile/core/base/logger_mixin.dart';
import 'package:shtcut_mobile/core/models.dart/meta.dart';
import 'package:shtcut_mobile/core/network/exceptions.dart';
import 'package:stacked/stacked.dart';

abstract class BaseService with ListenableServiceMixin, LoggerMixin {
  Future<BaseData<T>> executeRequest<T>(
      Future<dynamic> Function() apiCall) async {
    try {
      final response = await apiCall();
      logger.d('Handling response: $response');

      if (response is BaseData<T>) {
        return response;
      } else if (response is Map<String, dynamic>) {
        final meta = Meta.fromJson(response['meta'] as Map<String, dynamic>);
        if (meta.statusCode == 404 || !meta.success) {
          throw ApiException(meta.effectiveErrorMessage);
        }
        return BaseData<T>(meta: meta, data: response['data'] as T?);
      }
      throw ApiException('Unexpected response type');
    } on DioException catch (e) {
      if (e.response?.data is Map<String, dynamic>) {
        final meta =
            Meta.fromJson(e.response!.data['meta'] as Map<String, dynamic>);
        throw ApiException(meta.effectiveErrorMessage);
      }
      rethrow;
    }
  }
}
