class HttpStatusException implements Exception {
  final int statusCode;
  final String message;

  HttpStatusException(this.statusCode, [this.message = '']);

  @override
  String toString() {
    return 'HttpStatusException: HTTP $statusCode ${message.isNotEmpty ? '- $message' : ''}';
  }
}