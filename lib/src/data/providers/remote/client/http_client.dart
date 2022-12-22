abstract class IHttpClient {
  Future<Map<String, dynamic>> getRequest(
      {required String path, Map<String, dynamic> queryParameters = const {}});
  Future<Map<String, dynamic>> postRequest(
      {required String path, Map<String, dynamic> data = const {}});
}
