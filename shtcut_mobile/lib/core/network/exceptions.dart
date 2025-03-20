class ApiException implements Exception {
  String title;
  String message;
  String? stacktrace;

  ApiException(this.message, {this.stacktrace, this.title = "Error"});

  @override
  String toString() {
    return message;
  }
}

class AuthException extends ApiException {
  AuthException(super.message) : super(title: "Authentication Error");

  @override
  String toString() {
    return 'AuthError: $message';
  }
}

class NotFoundException extends ApiException {
  NotFoundException([super.message = "Resource not found"])
      : super(title: "Not Found Error");

  @override
  String toString() {
    return 'NotFoundException: $message';
  }
}

class IncorrectOTPError extends AuthException {
  IncorrectOTPError(super.message);

  @override
  String toString() {
    return 'OTPError: $message';
  }
}

class InternetConnectionException extends ApiException {
  InternetConnectionException([
    super.message =
        "Network is unreachable! Please, check your internet connection and try again.",
  ]);

  @override
  String toString() {
    return 'InternetConnectionException: $message';
  }
}

class TimeoutException extends ApiException {
  TimeoutException([super.message = "Request timed out"])
      : super(title: "Timeout Error");

  @override
  String toString() {
    return 'TimeoutException: $message';
  }
}

class ServerException extends ApiException {
  final int? statusCode;

  ServerException(this.statusCode, [String message = "Server error occurred"])
      : super(message, title: "Server Error");

  @override
  String toString() {
    return 'ServerException: $message (Status Code: $statusCode)';
  }
}

class RequestCancelledException extends ApiException {
  RequestCancelledException([super.message = "Request was cancelled"])
      : super(title: "Request Cancelled");

  @override
  String toString() {
    return 'RequestCancelledException: $message';
  }
}
