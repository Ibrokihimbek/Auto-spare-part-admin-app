class AppResponse {
  AppResponse({
    this.data,
    required this.error,
  });

  dynamic data;
  String error = "";
}