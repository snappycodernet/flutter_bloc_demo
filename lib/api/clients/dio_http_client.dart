import 'package:dio/dio.dart';
import 'package:simple_crud_app/models/api_response.dart';

import '../api_routes.dart';

class DioClient {
  // Private named constructor
  DioClient._();

  // maintain a singleton
  static final instance = DioClient._();

  factory DioClient() {
    return instance;
  }

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: ApiRoutes.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json
    ),
  );

  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress
      }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch(e) {
      rethrow;
    }
  }
}