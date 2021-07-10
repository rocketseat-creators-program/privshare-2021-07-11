import 'package:get_storage/get_storage.dart';
import 'package:privshare/modules/auth/models/user_model.dart';

class UserRepository {
  final GetStorage box;

  UserRepository(this.box);

  UserModel? getLocalUser() {
    final user = box.read('user');

    if (user == null) return null;

    if (user is UserModel) return user;

    if (user is String) return UserModel.fromJson(user);
  }

  void saveLocalUser(UserModel user) {
    box.write('user', user);
  }

  void removeLocalUser() {
    box.remove('user');
  }
}
