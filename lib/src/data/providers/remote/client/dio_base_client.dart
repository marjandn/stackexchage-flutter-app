import 'package:dio/dio.dart';
import 'package:stackexchange_app/src/app/errors/exceptions.dart';

import '../../../../app/constants/constants.dart';
import 'http_client.dart';

class DioBaseClient extends IHttpClient {
  Dio? _dioClient;

  DioBaseClient() {
    _dioClient ??= Dio(BaseOptions(
      baseUrl: Constants.baseUrl,
    ));
  }

  Dio getInstantce() => _dioClient!;

  @override
  Future<Map<String, dynamic>> postRequest(
      {required String path, Map<String, dynamic> data = const {}}) async {
    try {
      final response = await _dioClient!.post(path, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ServerException(response.statusMessage ?? "");
      }
    } on DioError catch (error) {
      throw ServerException(error.message);
    } catch (error) {
      throw ServerException("Bad Exception: ${error.toString()}");
    }
  }

  @override
  Future<Map<String, dynamic>> getRequest(
      {required String path, Map<String, dynamic> queryParameters = const {}}) async {
    try {
      final response = await _dioClient!.get(path, queryParameters: queryParameters);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ServerException(response.statusMessage ?? "");
      }
    } on DioError catch (error) {
      throw ServerException(error.message);
    } catch (error) {
      throw ServerException("Bad Exception: ${error.toString()}");
    }
  }
}
