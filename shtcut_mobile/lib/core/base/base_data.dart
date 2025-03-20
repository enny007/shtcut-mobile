import 'package:shtcut_mobile/core/models.dart/meta.dart';

class BaseData<T> {
  final Meta? meta;
  final T? data;

  BaseData({
    this.meta,
    this.data,
  });

  factory BaseData.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic)? dataConverter,
  }) {
    return BaseData(
      meta: json['meta'] != null
          ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
          : null,
      data: json['data'] != null && dataConverter != null
          ? dataConverter(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'meta': meta!.toJson(),
        'data': data,
      };

  @override
  String toString() => 'BaseData(meta: $meta, data: $data)';

  bool get isSuccess => meta!.success;
}
