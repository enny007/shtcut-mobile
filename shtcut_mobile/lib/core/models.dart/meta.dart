class Meta {
  final int? statusCode;
  final int? code;
  final bool success;
  final String? token;
  final ErrorDetails? error;
  final String? message;
  final Pagination? pagination;

  Meta({
    this.statusCode,
    this.code,
    required this.success,
    this.token,
    this.error,
    this.message,
    this.pagination,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    final errorJson = json['error'];
    final ErrorDetails? errorDetails = errorJson != null
        ? ErrorDetails.fromJson(errorJson as Map<String, dynamic>)
        : null;

    return Meta(
      statusCode: json['statusCode'] as int?,
      code: json['code'] as int?,
      success: json['success'] as bool? ??
          (json['statusCode'] != null ? json['statusCode'] < 400 : false),
      token: json['token'] as String?,
      error: errorDetails,
      message: json['message'] as String?,
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        if (statusCode != null) 'statusCode': statusCode,
        'success': success,
        if (token != null) 'token': token,
        if (error != null) 'error': error!.toJson(),
        if (message != null) 'message': message,
      };

  @override
  String toString() =>
      'Meta(statusCode: $statusCode, success: $success, token: $token, error: $error, message: $message)';

  bool get isSuccess =>
      success && error == null && (statusCode == null || statusCode! < 400);

  String get effectiveErrorMessage {
    return error?.message ?? message ?? 'An unknown error occurred';
  }

  bool get isError {
    return statusCode != null && statusCode! >= 400;
  }
}

class ErrorDetails {
  final int? code;
  final String? message;
  final Map<String, Map<String, String>>? messages;

  ErrorDetails({
    this.code,
    this.message,
    this.messages,
  });

  factory ErrorDetails.fromJson(Map<String, dynamic> json) => ErrorDetails(
        code: json['code'] as int?,
        message: json['message'] as String?,
        messages: json['messages'] != null
            ? Map<String, Map<String, String>>.from(
                json['messages'].map(
                  (key, value) => MapEntry(
                    key,
                    Map<String, String>.from(value),
                  ),
                ),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        if (code != null) 'code': code,
        'message': message,
        if (messages != null) 'messages': messages,
      };

  @override
  String toString() =>
      'ErrorDetails(code: $code, message: $message, messages: $messages)';
}

class Pagination {
  final int totalCount;
  final int perPage;
  final int? current;
  final String currentPage;
  final int? next;
  final String? nextPage;

  Pagination({
    required this.totalCount,
    required this.perPage,
    this.current,
    required this.currentPage,
    this.next,
    this.nextPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalCount: json['totalCount'] as int,
        perPage: json['perPage'] as int,
        current: json['current'] as int?,
        currentPage: json['currentPage'] as String,
        next: json['next'] as int?,
        nextPage: json['nextPage'] as String?,
      );
}
