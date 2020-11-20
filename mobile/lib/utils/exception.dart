class NetworkException implements Exception {
  final Map<String, dynamic> message;

  NetworkException({this.message});
}
