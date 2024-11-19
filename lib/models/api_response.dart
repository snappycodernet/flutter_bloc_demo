import 'package:simple_crud_app/models/user.dart';

class ApiResponse<T> {
  String? errorMessage;
  int? statusCode;
  T? data;
  Object? originalResponse;

  ApiResponse({this.errorMessage, this.statusCode, this.data, this.originalResponse});
}