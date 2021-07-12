import 'package:get_storage/get_storage.dart';
import 'package:privshare/modules/auth/models/user_model.dart';

class UserRepository {
  final GetStorage _storage;

  UserRepository(this._storage);

  UserModel? getLocalUser() {
    final user = _storage.read('user');

    if (user == null) return null;

    if (user is UserModel) return user;

    if (user is String) return UserModel.fromJson(user);
  }

  void saveLocalUser(UserModel user) {
    _storage.write('user', user);
  }

  void removeLocalUser() {
    _storage.remove('user');
  }
}
