class ApiResponse<T> {
  final int statusCode;
  final T? payload;

  bool get success => statusCode == 200;

  const ApiResponse({
    required this.statusCode,
    required this.payload,
  });
}
