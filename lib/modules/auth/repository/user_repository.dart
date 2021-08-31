import 'package:get_storage/get_storage.dart';
import 'package:privshare/modules/auth/models/user_model.dart';

class UserRepository {
  final GetStorage box;
  final _key = 'user';

  UserRepository(this.box);

  UserModel? getLocalUser() {
    final user = box.read(_key);

    if (user == null) return null;

    if (user is UserModel) return user;

    if (user is String) return UserModel.fromJson(user);
  }

  void saveLocalUser(UserModel user) {
    box.write(_key, user);
  }

  void removeLocalUser() {
    box.remove(_key);
  }
}
