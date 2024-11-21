import 'dart:math';

import 'package:dio/dio.dart';
import 'package:simple_crud_app/api/api_routes.dart';
import 'package:simple_crud_app/api/clients/dio_http_client.dart';
import 'package:simple_crud_app/errors/dio_exceptions.dart';
import 'package:simple_crud_app/models/api_response.dart';
import 'package:simple_crud_app/models/post.dart';

class PostRepository {
  // Private named constructor
  PostRepository._();

  // maintain a singleton
  static final instance = PostRepository._();

  factory PostRepository() {
    return instance;
  }

  Future<ApiResponse<List<Post>>> getUserPosts(int userId) async {
    try {
      final response = await DioClient.instance.get('${ApiRoutes.posts}?userId=$userId');
      List<Post> posts = List.empty(growable: true);

      for(var postJson in response.data as List<dynamic>) {
        Post post = Post.fromJson(postJson);
        posts.add(post);
      }

      return ApiResponse<List<Post>>(data: posts, statusCode: response.statusCode, originalResponse: response);
    } on DioException catch(e) {
      var error = DioErrors(e);

      return ApiResponse<List<Post>>(errorMessage: error.errorMessage, statusCode: error.statusCode, originalResponse: e.response);
    } catch(e) {
      return ApiResponse<List<Post>>(errorMessage: "Something went wrong");
    }
  }
}