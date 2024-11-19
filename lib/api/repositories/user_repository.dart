import 'dart:math';

import 'package:dio/dio.dart';
import 'package:simple_crud_app/api/api_routes.dart';
import 'package:simple_crud_app/api/clients/dio_http_client.dart';
import 'package:simple_crud_app/errors/dio_exceptions.dart';
import 'package:simple_crud_app/models/api_response.dart';

import '../../models/user.dart';

class UserRepository {
  // Private named constructor
  UserRepository._();

  // maintain a singleton
  static final instance = UserRepository._();

  factory UserRepository() {
    return instance;
  }

  Future<ApiResponse<User>> getUser() async {
    try {
      var random = Random();
      int min = 1;
      int max = 10;
      int randomNumber = min + random.nextInt(max - min + 1);

      final response = await DioClient.instance.get('${ApiRoutes.users}/$randomNumber');
      final user = User.fromJson(response.data);

      return ApiResponse<User>(data: user, statusCode: response.statusCode, originalResponse: response);
    } on DioException catch(e) {
      var error = DioErrors(e);

      return ApiResponse<User>(errorMessage: error.errorMessage, statusCode: error.statusCode, originalResponse: e.response);
    } catch(e) {
      return ApiResponse<User>(errorMessage: "Something went wrong");
    }
  }
}