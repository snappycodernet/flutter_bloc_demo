import 'package:simple_crud_app/api/repositories/user_repository.dart';
import 'package:simple_crud_app/models/api_response.dart';

import '../models/user.dart';

class UserService {
  // Private named constructor
  UserService._();

  // maintain a singleton
  static final instance = UserService._();

  factory UserService() {
    return instance;
  }

  Future<User> getUser() async {
    try {
      ApiResponse<User> response = await UserRepository.instance.getUser();

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