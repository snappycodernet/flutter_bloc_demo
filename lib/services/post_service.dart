import 'package:simple_crud_app/api/repositories/post_repository.dart';
import 'package:simple_crud_app/api/repositories/user_repository.dart';
import 'package:simple_crud_app/models/api_response.dart';

import '../models/post.dart';

class PostService {
  // Private named constructor
  PostService._();

  // maintain a singleton
  static final instance = PostService._();

  factory PostService() {
    return instance;
  }

  Future<List<Post>> getUserPosts(int userId) async {
    try {
      ApiResponse<List<Post>> response = await PostRepository.instance.getUserPosts(userId);

      if(response.data != null) {
        return response.data!;
      }

      // TODO: do some error handling here like showing an error modal
      throw response.errorMessage ?? "Something went wrong";
    }
    catch(e) {
      // TODO: possibly add some error handling here?
      rethrow;
    }
  }
}