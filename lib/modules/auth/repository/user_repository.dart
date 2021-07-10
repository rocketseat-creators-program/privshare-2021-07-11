import 'package:privshare/modules/auth/models/user_model.dart';

class UserRepository {
  UserRepository();

  UserModel? getLocalUser() {
    final user = null;

    if (user == null) return null;

    if (user is UserModel) return user;

    if (user is String) return UserModel.fromJson(user);
  }

  void saveLocalUser(UserModel user) {}

  void removeLocalUser() {}
}
