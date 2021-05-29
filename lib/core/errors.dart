abstract class Failure implements Exception {
  final String message;

  Failure(
    this.message,
  );

  @override
  String toString() {
    return message;
  }
}

class ApiError extends Failure {
  ApiError(String message) : super(message);
}

class UnknownError extends Failure {
  UnknownError(String message) : super(message);
}
